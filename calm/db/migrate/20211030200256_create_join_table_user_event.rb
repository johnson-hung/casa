class CreateJoinTableUserEvent < ActiveRecord::Migration
  def up
    create_table :user_events do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.integer :user_status
      
      t.timestamps
      
      t.index [:event_id]
    end
  end
  
  def down
    drop_table :user_events
  end
end
