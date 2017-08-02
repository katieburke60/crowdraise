class CampaignsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:index]

  def new
    if !has_account?
      redirect_to create_account_path
    end
      @campaign = Campaign.new
  end

  def create
    campaign = Campaign.new(campaign_params)
    campaign.creator = current_user
    campaign.save!
    redirect_to campaign_path(campaign)
  end

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.all.find(params[:id])
    @backers = @campaign.backers
  end

  def edit
    @campaign = Campaign.all.find(params[:id])
  end

  def update
    @campaign = Campaign.all.find(params[:id])
    if !@campaign.update(campaign_params)
      render 'campaign/edit'
    else
      redirect_to @campaign
    end
  end

  def destroy
    campaign = Campaign.all.find(params[:id])
    campaign.destroy
    redirect_to '/'
  end

private
  def campaign_params
    params.require(:campaign).permit(:image, :name, :description, :funding_goal, :deadline)
  end

end
