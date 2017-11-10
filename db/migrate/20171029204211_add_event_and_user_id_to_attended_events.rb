class AddEventAndUserIdToAttendedEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :attended_events, :event_id, :integer
    add_column :attended_events, :user_id, :integer
  end
end
