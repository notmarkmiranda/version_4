class CreateSeason < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.boolean :active
      t.references :league, foreign_key: true
    end
  end
end
