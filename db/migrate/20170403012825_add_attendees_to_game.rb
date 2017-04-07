class AddAttendeesToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :attendees, :integer
  end
end
