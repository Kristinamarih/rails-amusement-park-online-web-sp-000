class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.attraction.min_height > self.user.height 
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            self.user.tickets == self.user.tickets - self.attraction.tickets &&
            self.user.happiness == self.user.happiness + self.attraction.happiness_rating &&
            self.user.nausea == self.user.nausea + self.attraction.nausea_rating
         end
    end
end
