class Backer < ApplicationRecord
  has_many :campaigns, through: :campaign_contributions
  has_many :charges
end
