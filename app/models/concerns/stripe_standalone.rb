class StripeStandalone < Struct.new( :user )
  def create_account
    @account = Stripe::Account.create(
      # :type => 'standard',
      :country => 'US',
      :email => current_user.email
      :managed => false
    )
    if @account
      user.update_attributes(
        :stripe_account_type => 'standalone',
        :stripe_user_id => @account.id,
        :secret_key => @account.keys.secret,
        #why aren't we worried about saving this in the database?
        :publishable_key => @account.keys.publishable,
        :stripe_account_status => @account.status,
      )
    end
    binding.pry
    @account
  end
  end

private

  def account_status
    {
      details_submitted: account.details_submitted,
      charges_enabled: account.charges_enabled,
      transfers_enabled: account.transfers_enabled
    }
  end

  def account
    @account ||= Stripe::Account.retrieve( user.stripe_user_id )
  end
end
