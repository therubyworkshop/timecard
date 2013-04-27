class Stamp < ActiveRecord::Base
  attr_accessible :card_id, :completed_at, :duration, :initials, :note, :tags
  belongs_to :card
  validates_presence_of :initials, :duration, :completed_at, :card_id
end
