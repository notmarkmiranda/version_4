class AddDefaultValueToAdditionalExpense < ActiveRecord::Migration[5.0]
  def up
    change_column :players, :additional_expense, :integer, default: 0
  end

  def down
    change_column :players, :additiona_expense, :integer, default: nil
  end
end
