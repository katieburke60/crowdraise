1. Retrieve authorization code from URL (will hit redirect location)
  --http://localhost:3000?code={AUTHORIZATION_CODE}

2. Post request to complete connection and get users account id
  curl https://connect.stripe.com/oauth/token \
     -d client_secret=sk_test_S3hhti13GTqHqewaVxv9mczR \
     -d code="{AUTHORIZATION_CODE}" \
     -d grant_type=authorization_code

3. store stripe_user_id (as the account id to make links later)

4. Make charge using connected account
    charge = Stripe::Charge.create({
    :amount => 1000,
    :currency => "usd",
    :application_fee => 123,
    :source => "tok_visa",
  }, :stripe_account => "{CONNECTED_STRIPE_ACCOUNT_ID}")

A. Create OAuth link
- client_id: ca_B5JN7rHYbepj0sp3Lngy73R8bcIRbcFO
- redirect_uri: http://localhost:3000

configure do
  config = YAML::load(File.open('config.yml'))

  set :api_key, config['api_key']
  set :client_id, config['client_id']

  options = {
    :site => 'https://connect.stripe.com',
    :authorize_url => '/oauth/authorize',
    :token_url => '/oauth/token'
  }

  set :client, OAuth2::Client.new(settings.client_id, settings.api_key, options)
end

get '/authorize' do
  params = {
    :scope => 'read_write'
  }

  # Redirect the user to the authorize_uri endpoint
  url = settings.client.auth_code.authorize_url(params)
  redirect url
end

get '/oauth/callback' do
  # Pull the authorization_code out of the response
  code = params[:code]

  # Make a request to the access_token_uri endpoint to get an access_token
  @resp = settings.client.auth_code.get_token(code, :params => {:scope => 'read_write'})
  @access_token = @resp.token

  # Use the access_token as you would a regular live-mode API key
  # TODO: Stripe logic

  erb :callback
end



when 'payments'
  h2 Connect your Rocket Rides account to Stripe
  p We use Stripe to make sure you get paid on time and keep your personal and bank details secure.
  a.button(href='/pilots/stripe/authorize') Setup Payments on Stripe

when 'done'
  .checkmark
  h2 You’re ready to get paid!
  p Download the app, fire up your rocket, and start taking your first passengers!
  a.button(href='/pilots/dashboard') View Your Pilot Dashboard
