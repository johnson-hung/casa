class CreateResearchInterestUsers < ActiveRecord::Migration
  def change
    create_table :research_interest_users do |t|

      t.timestamps null: false
    end
  end
end
