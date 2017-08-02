class Campaign < ApplicationRecord
  include ActionView::Helpers
  validates :name, :deadline, :funding_goal, :description, presence: true, uniqueness: true 
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :fundings
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_many :backers, :class_name => 'User', :foreign_key => 'backer_id', :through => 'fundings'

  def raised
    r = self.fundings.inject(0){ |sum, funding| sum + funding.amount }
    (number_with_precision(r, precision: 2,  strip_insignificant_zeros: true)).to_i
  end

  def percent_complete
    p = self.raised / self.funding_goal
    (p*100).round
    # number_with_precision(p, precision: 4,  strip_insignificant_zeros: false)
  end

  def number_backers
    self.backers.uniq.length
  end

  def days_left
    hours_left = (self.deadline.to_time - DateTime.now.to_time) / 60 / 60
    days_left = (hours_left / 24).round
  end

end
