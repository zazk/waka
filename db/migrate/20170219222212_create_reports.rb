class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.integer :kind
      t.decimal :bills
      t.decimal :visa
      t.date :date

      t.timestamps
    end
  end
end
