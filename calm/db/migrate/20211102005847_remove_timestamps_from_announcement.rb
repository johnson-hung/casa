class RemoveTimestampsFromAnnouncement < ActiveRecord::Migration
  def change
    remove_column :announcements, :created_at, :string
    remove_column :announcements, :updated_at, :string
  end
end
