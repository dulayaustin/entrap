class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :product
      t.references :size, foreign_key: true
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
