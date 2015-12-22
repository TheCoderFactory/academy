class InfoSessionDate < ActiveRecord::Base
  has_many :info_session_attendees
end
