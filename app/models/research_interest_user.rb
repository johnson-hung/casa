class ResearchInterestUser < ActiveRecord::Base
    belongs_to :users
    belongs_to :research_interests
end
