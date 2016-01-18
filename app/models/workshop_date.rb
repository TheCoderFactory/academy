class WorkshopDate < ActiveRecord::Base
  has_many :workshop_attendees
end
