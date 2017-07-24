class CampaignContributions < ApplicationRecord
  belongs_to :campaigns
  belongs_to :backer
end
