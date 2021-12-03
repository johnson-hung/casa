class CreateJoinTableUsersResearchInterests < ActiveRecord::Migration
  def change
    create_join_table :users, :research_interests do |t|
        t.belongs_to :users
        t.belongs_to :research_interests
        
       t.index [:user_id, :research_interest_id], name: "ur_id"
       t.index [:research_interest_id, :user_id], name: "ru_id"
       
    end
  end
end
