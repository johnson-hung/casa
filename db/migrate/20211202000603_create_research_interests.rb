class CreateResearchInterests < ActiveRecord::Migration
  def change
    create_table :research_interests do |t|
      t.string :field

      t.timestamps null: false
    end
  end
end
