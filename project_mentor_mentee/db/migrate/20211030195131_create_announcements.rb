class CreateAnnouncements < ActiveRecord::Migration
  def up
    create_table :announcements do |t|
      t.text :description
      
      t.timestamps
    end
  end
  
  def down
    drop_table :announcements
  end
end
