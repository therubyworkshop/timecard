class Card < ActiveRecord::Base
  attr_accessible :name, :rate
  has_many :stamps
  validates_presence_of :name, :rate
  validates_uniqueness_of :name
end
