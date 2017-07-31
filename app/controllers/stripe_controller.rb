class StripeController < ApplicationController
  def new
    connector = StripeStandalone.new(current_user)
    account = connector.create_account
    if account
      flash[:notice] = "Standalone Stripe account created! <a target='_blank' rel='platform-account' href='https://dashboard.stripe.com/test/applications/users/#{account.id}'>View in dashboard &raquo;</a>"
    else
      flash[:error] = "Unable to create Stripe account!"
    end
    redirect_to user_path(current_user)
  end

  def oauth
    client_id = Rails.configuration.stripe[:client_id]
    redirect_uri = 'http://localhost:3000/connect/authorize'
    stripe_url = "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=#{client_id}&scope=read_write&redirect_uri=#{redirect_uri}"

    redirect_to stripe_url
  end

  def authorize
    resp = Faraday.post('https://connect.stripe.com/oauth/token') do |req|
      req.params['client_id'] =  Rails.configuration.stripe[:client_id]
      req.params['client_secret'] = Rails.configuration.stripe[:secret_key]
      req.params['grant_type'] = 'authorization_code'
      req.params['code'] = params[:code]
    end
    body = JSON.parse(resp.body)
    if body['error']
      @error = body['error']
      @error_description = body['error_description']
    else
      current_user.update_attributes(
        :stripe_user_id => body['stripe_user_id'],
        :stripe_account_type => 'oauth',
        :publishable_key => body['stripe_publishable_key'],
        :secret_key => body['access_token'],
        :refresh_token => body['refresh_token'],
      )
      current_user.save
    end
  end

end
