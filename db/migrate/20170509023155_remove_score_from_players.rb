class RemoveScoreFromPlayers < ActiveRecord::Migration[5.0]
  def up
    remove_column :players, :score
  end

  def down
    add_column :players, :score, :float
  end
end
