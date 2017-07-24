class Charge < ApplicationRecord
  belongs_to :campaign
  belongs_to :backer
end
