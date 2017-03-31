class CreatePlayer < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :participant, foreign_key: true
      t.integer :finishing_place
      t.references :game, foreign_key: true
      t.integer :additional_expense
    end
  end
end
