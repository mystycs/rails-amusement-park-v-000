class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  
  def take_ride
    message = "Sorry."
    
    if (user.tickets - attraction.tickets) < 0 
      message << " You do not have enough tickets the #{attraction.name}."
    end
    
    if user.height < attraction.min_height 
      message << " You are not tall enough to ride the #{attraction.name}."
    end
    
    if message == "Sorry."
      user.tickets = user.tickets - attraction.tickets
      user.happiness = user.happiness + attraction.happiness_rating
      user.nausea = user.nausea + attraction.nausea_rating
      user.save
    else
      message
    end
  end
  
  def too_short?
    user.height < attraction.min_height
  end
  
  def not_enough_tickets?
    (user.tickets - attraction.tickets) < 0
  end
end
