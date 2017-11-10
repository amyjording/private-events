class RenameAttendedEventsToEventAttendings < ActiveRecord::Migration[5.1]
  def change
  	rename_table :attended_events, :event_attendings
  end
end
