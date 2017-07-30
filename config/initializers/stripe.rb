Rails.configuration.stripe = {
  :publishable_key => 'pk_test_vtLuuE4xy3iphedpVjHtvHwy',
  :secret_key => 'sk_test_S3hhti13GTqHqewaVxv9mczR',
  :client_id => 'ca_B5JN7rHYbepj0sp3Lngy73R8bcIRbcFO',
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  # :secret_key =>      ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
