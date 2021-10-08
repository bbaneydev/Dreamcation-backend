class Trip < ActiveRecord::Base
    belongs_to :user

    def name
        "#{self.user.firstName} #{self.user.lastName}"
    end

    def self.list
        Trip.all.map do |trip| {
            trip_id: trip.id,
            name: trip.name,
            title: trip.title, 
            location: trip.location, 
            image: trip.image, 
            description: trip.description, 
            lengthOfStay: trip.lengthOfStay
        }
        end
    end
end