class Card < ActiveRecord::Base
  attr_accessible :name, :rate
  has_many :stamps
  validates_presence_of :name, :rate
  validates_uniqueness_of :name

  def total_cost
    self.total_duration * self.rate
  end

  def total_duration
    self.stamps.sum(:duration)
  end
end
