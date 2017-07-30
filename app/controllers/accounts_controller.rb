require 'rest-client'

class AccountsController < ApplicationController
  def new
  end

  def create
    code = params[:code]
    error = params[:error]

    if error
      flash[:alert] = params[:error_description]
    else
      stripe_url = 'https://connect.stripe.com/oauth/token'
      RestClient.post(stripe_url, {
        client_secret: 'sk_test_S3hhti13GTqHqewaVxv9mczR',
        code: code
        grant_type: 'authorization_code'
        })

        redirect_to '/account/account.id'
    end

  end

  def show

  end

end

#Stripe Connect stuff
# acct = Stripe::Account.create({
#     :country => "US",
#     :type => "custom"
# })
#
# charge = Stripe::Charge.create({
#   :amount => 1000,
#   :currency => "usd",
#   :source => "tok_visa",
#   :destination => {
#     :account => "{CONNECTED_STRIPE_ACCOUNT_ID}",
#   }
# })
# acct_elJlsZbwmcv0MuUg
