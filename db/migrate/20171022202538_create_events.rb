class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :event_date
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
