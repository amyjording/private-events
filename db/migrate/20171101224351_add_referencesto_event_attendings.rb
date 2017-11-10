class AddReferencestoEventAttendings < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, foreign_key: true, index: true
  	add_reference :events, foreign_key: true, index: true
  end
end
