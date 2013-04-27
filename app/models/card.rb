class Card < ActiveRecord::Base
  attr_accessible :name, :rate
  has_many :stamps
end
