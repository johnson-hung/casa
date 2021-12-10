class AddOrganizerToUser < ActiveRecord::Migration
  def change
    add_column :users, :organizer, :integer
  end
end
