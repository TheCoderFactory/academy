class InfoSessionDate < ActiveRecord::Base
  has_many :info_session_attendees

  def self.reverse_chron_order
    order(session_date: :desc)
  end
end
