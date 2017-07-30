class CampaignsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:index]

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.all.find(params[:id])
    @backers = @campaign.backers
  end

end
