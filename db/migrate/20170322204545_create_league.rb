class CreateLeague < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.references :user, foreign_key: true
    end
  end
end
