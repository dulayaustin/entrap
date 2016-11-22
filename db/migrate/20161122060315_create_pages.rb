class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :area
      t.text :content

      t.timestamps
    end
    default = Hash.new
    default = { "about_us" => "Hi this is about us page", "contact_us" => "You may contact us here" }
    default.each do |area, content|
      Page.create(area: area, content: content)
    end
  end
end
