class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.all.find(params[:id])
    @backers = @campaign.backers
  end

end
