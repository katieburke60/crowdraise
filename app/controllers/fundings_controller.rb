class FundingsController < ApplicationController
  def index
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @amount = params[:amount].to_i
    campaign = Campaign.all.find(params[:campaign_id])
    current_user = User.find_by_id(session[:user_id])

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

    funding = Funding.create(
      :campaign_id => campaign.id,
      :user_id => current_user.id,
      :amount => @amount,
      :currency => 'usd',
    )

    stripe_charge = Stripe::Charge.create(
    :customer => customer.id,
    :amount => @amount,
    :description => 'Rails Stripe customer',
    :currency => 'usd',
    )

    funding.stripe_id = stripe_charge.id
    funding.save
    binding.pry

    redirect_to campaign_path(params[:campaign_id])

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_campaign_funding_path(params[:campaign_id])
  end
end