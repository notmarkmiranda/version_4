class AddSlugToLeague < ActiveRecord::Migration[5.0]
  def change
    add_column :leagues, :slug, :string
  end
end
