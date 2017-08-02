class Funding < ApplicationRecord
  belongs_to :campaign
  belongs_to :backer, :class_name => 'User', :foreign_key => 'user_id'

  # def self.customer_exists?
  #   !!Stripe::Customer.retrieve(User.find_by_id(session[:user_id]).customer_id)
  # end
end
