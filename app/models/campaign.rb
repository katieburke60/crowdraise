class Campaign < ApplicationRecord
  has_many :backers, through: :campaign_contributions
  has_many :charges
  belongs_to :category
end
