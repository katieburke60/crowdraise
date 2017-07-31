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
    stripe_account = campaign.creator.stripe_user_id

    new_funding = FundingsAdapter.new
    new_funding.is_customer?

    funding = Funding.create(
      :campaign_id => campaign.id,
      :user_id => current_user.id,
      :amount => @amount,
      :currency => 'usd',
    )
    stripe_charge = Stripe::Charge.create({
      :amount => @amount,
      :source => "tok_visa",
      #what do they mean by tokenizing a charge with Elements?
      :description => 'Rails Stripe customer',
      :currency => 'usd',
      # :application_fee => 123,
    }, :stripe_account => stripe_account)

    funding.stripe_id = stripe_charge.id
    funding.save

    redirect_to campaign_path(params[:campaign_id])

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_campaign_funding_path(params[:campaign_id])
  end

  # def refund
  #   refund = Stripe::Refund.create({
  #       :charge => "{CHARGE_ID}",
  #       :reverse_transfer => true,
  #   })
  # end
end
