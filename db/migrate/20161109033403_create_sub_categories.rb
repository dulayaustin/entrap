class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.references :category, index: true
      t.string :name
      t.timestamps
    end
    bjj = Category.find_by(name: "BJJ Gi's")
    shorts = Category.find_by(name: "Shorts") 
    rashg = Category.find_by(name: "Rash Guards")
    apparel = Category.find_by(name: "Apparel")
    ["Classic", "Kombina Series", "Cosmic Premium"].each do |gi|
        SubCategory.create(category_id: bjj.id, name: gi)
    end
    ["MMA Shorts", "Compression"].each do |s|
        SubCategory.create(category_id: shorts.id, name: s)
    end
    ["Long", "Short"].each do |rg|
        SubCategory.create(category_id: rashg.id, name: rg)
    end
    ["Tees", "Caps"].each do |ap|
        SubCategory.create(category_id: apparel.id, name: ap)
    end
  end
end
