class AddInvitedToEventAttendings < ActiveRecord::Migration[5.1]
  def change
    add_column :event_attendings, :invited, :boolean, default: false
  end
end
