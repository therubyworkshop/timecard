class Stamp < ActiveRecord::Base
  belongs_to :card
  attr_accessible :completed_at, :duration, :initials, :note, :tags
end
