class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    ["BJJ Gi's", "Shorts", "Rash Guards", "Apparel"].each do |c|
      Category.create(name: c)
    end
  end
end
