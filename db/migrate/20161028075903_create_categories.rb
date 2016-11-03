class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    ["gi", "shirts", "shorts"].each do |c|
      Category.find_or_create_by(name: c)
    end
  end
end
