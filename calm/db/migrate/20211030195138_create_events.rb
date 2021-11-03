class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.string :location 
      t.datetime :start_at
      t.datetime :end_at
      
      t.timestamps
    end
  end
  
  def down
    drop_table :events
  end
end
