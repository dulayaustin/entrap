class CreateFightTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :fight_teams do |t|
      t.string :name
      t.text :description
      t.attachment :picture

      t.timestamps
    end
  end
end
