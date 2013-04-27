class Card < ActiveRecord::Base
  attr_accessible :name, :rate
  has_many :stamps
  validates_presence_of :name, :rate
  validates_uniqueness_of :name

  def self.grand_total_duration
    # TODO #3
    # this works, but is begging to be refactored.
    # 42 bonus points for a more elegant solution.
    grand_total_duration = 0
    self.all.each do |card|
      grand_total_duration += card.total_duration
    end
    grand_total_duration
  end

  def total_cost
    self.total_duration * self.rate
  end

  def total_duration
    self.stamps.sum(:duration)
  end
end
