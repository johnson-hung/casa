class Event < ActiveRecord::Base
    has_many :user_events
    has_many :users, through: :user_events
    
    def self.to_csv
    attributes = %w{id email name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
