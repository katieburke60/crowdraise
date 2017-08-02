class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_many :fundings
  has_many :backed_campaigns, :class_name => 'Campaign', :foreign_key => 'backer_id', through: :fundings
  has_many :created_campaigns, :class_name => 'Campaign', :foreign_key => 'creator_id'

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    user && user.authenticate(password)
  end
end
