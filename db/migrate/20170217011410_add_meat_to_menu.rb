class AddMeatToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :meat, :integer
  end
end
