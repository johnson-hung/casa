class Announcement < ActiveRecord::Base
    def self.all_ratings
     %w(G PG PG-13 NC-17 R)
    end
    
    def self.find_rating announcement
     rating = Announcement.find_by(title: announcement_title).rating
     return rating
    end
end
