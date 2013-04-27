class Stamp < ActiveRecord::Base
  belongs_to :card
  attr_accessible :card_id, :completed_at, :duration, :initials, :note, :tags
end
