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
    connector = StripeOauth.new(current_user)
    url, error = connector.oauth_url( redirect_uri: stripe_confirm_url )

    if url.nil?
      flash[:error] = error
      redirect_to user_path( current_user )
    else
      redirect_to url
    end
  end

  def confirm
    connector = StripeOauth.new(current_user)
    if params[:code]
      connector.verify
    elsif params[:error]
      flash[:error] = "Authorization request denied"
    end

    redirect_to user_path(current_user)
  end

end
