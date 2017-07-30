module StripeMembership
  def self.create_membership(email: email, stripe_token: stripe_token, plan: plan)
    Stripe::Customer.create(
      email: email,
      source: stripe_token,
      plan: plan,
    )
  end
end
