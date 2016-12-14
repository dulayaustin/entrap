class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :product, foreign_key: true
      t.string :user_name
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
