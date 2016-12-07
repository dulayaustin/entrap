class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string :label

      t.timestamps
    end
    ["a1", "a2", "a3", "a4", "a5", "s", "m", "lg", "xl", "free size"].each do |s|
      Size.find_or_create_by(label: s.downcase)
    end
  end
end
