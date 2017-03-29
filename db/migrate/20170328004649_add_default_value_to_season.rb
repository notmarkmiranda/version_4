class AddDefaultValueToSeason < ActiveRecord::Migration[5.0]
  def up
    change_column :seasons, :active, :boolean, default: true
  end

  def down
    change_column :seasons, :active, :boolean, default: nil
  end
end
