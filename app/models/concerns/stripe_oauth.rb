require 'oauth2'
require_relative '../../helpers/application_helper.rb'

class StripeOauth < Struct.new( :user )
  def oauth_url(params)
    url = client.authorize_url({
      # def authorize_url(params = {})
      #   params = (params || {}).merge(redirection_params)
      #   connection.build_url(options[:authorize_url], params).to_s
      # end
      :scope => 'read_write',
      :stripe_landing => 'login',
      :stripe_user => {
        :email => 'ryankatherineburke@gmail.com'
      }
    }.merge(params))

    begin
      response = RestClient.get url
    rescue => e
      json = JSON.parse(e.response.body) rescue nil
      return [ nil, params[:error_description] ]
    end
  end
  # Upon redirection back to this app, we'll have
  # a 'code' that we can use to get the access token
  # and other details about our connected user.

  def verify(code)
    data = client.get_token(code, {
      :headers => {
        'Authorization' => "Bearer #{Rails.application.secrets.stripe_secret_key}"
      }
    })
    user.update_attributes(
      :stripe_user_id => data.params['stripe_user_id'],
      :stripe_account_type => 'oauth',
      :publishable_key => data.params['stripe_publishable_key'],
      :secret_key => data.token,
      :currency => 'USD',
    )
  end

  private

  def client
    @client ||= OAuth2::Client.new(
      Rails.configuration.stripe[:client_id],
      Rails.configuration.stripe[:secret_key],
      {
        :site => 'https://connect.stripe.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }
    ).auth_code
  end
end
