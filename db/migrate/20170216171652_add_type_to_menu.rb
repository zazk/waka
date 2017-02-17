class AddTypeToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :kind, :integer , :default=>1
  end
end
