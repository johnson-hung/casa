class CreateJoinTableUserResearchInterest < ActiveRecord::Migration
  def change
    create_join_table :users, :research_interests do |t|
      # t.index [:user_id, :research_interest_id]
      # t.index [:research_interest_id, :user_id]
    end
  end
end
