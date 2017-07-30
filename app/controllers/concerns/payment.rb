module CurrentUser
  # Make a one-off payment to the user.
  def pay
    # Find the user to pay.
    user = User.find( params[:id] )
    # Charge $10.
    amount = 1000
    # Calculate the fee amount that goes to the application.
    fee = (amount * Rails.application.secrets.fee_percentage).to_i

    begin
      charge_attrs = {
        amount: amount,
        currency: user.currency,
        source: params[:token],
        description: "Test Charge via Stripe Connect",
        application_fee: fee
      }

      case params[:charge_on]
      when 'connected'
        # Use the user-to-be-paid's access token
        # to make the charge directly on their account
        charge = Stripe::Charge.create( charge_attrs, user.secret_key )
      when 'platform'
        # Use the platform's access token, and specify the
        # connected account's user id as the destination so that
        # the charge is transferred to their account.
        charge_attrs[:destination] = user.stripe_user_id
        charge = Stripe::Charge.create( charge_attrs )
      end

      flash[:notice] = "Charged successfully! <a target='_blank' rel='#{params[:charge_on]}-account' href='https://dashboard.stripe.com/test/payments/#{charge.id}'>View in dashboard &raquo;</a>"

    rescue Stripe::CardError => e
      error = e.json_body[:error][:message]
      flash[:error] = "Charge failed! #{error}"
    end

    redirect_to user_path( user )
  end

end
