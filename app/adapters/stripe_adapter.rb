class FundingsAdapter
  def is_customer?
    if !!current_user.customer_id
      customer = Stripe::Customer.retrieve(current_user.customer_id)
    else
      customer =
      Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source => params[:stripeToken],
      )
      current_user.customer_id = customer.id
    end
  end
end
