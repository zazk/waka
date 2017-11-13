class AddExpensesToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :expenses, :decimal
  end
end
