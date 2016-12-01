class CreateSubCategorySizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_category_sizes do |t|
      t.references :sub_category, foreign_key: true
      t.references :size, foreign_key: true

      t.timestamps
    end
    bjj_gi = Category.find_by(name: "BJJ Gi's")
    bjj_gi.sub_categories.each do |gi_sub|
      Size.where(measurement: ["a1", "a2", "a3", "a4", "a5"]).each do |gi_size|
        SubCategorySize.create(sub_category_id: gi_sub.id, size_id: gi_size.id)
      end
    end
    SubCategory.where(name: ["MMA Shorts", "Compression", "Long", "Short", "Tees"]).each do |sub_cat|
      Size.where(measurement: ["s", "m", "lg", "xl"]).each do |standard_size|
        SubCategorySize.create(sub_category_id: sub_cat.id, size_id: standard_size.id)
      end
    end
  end
end
