class AttractionsController < ApplicationController
  
  def new
    @attraction = Attraction.new
  end
  
  def create
    @attraction = Attraction.create(params.require(:attraction).permit(:name, :tickets,
    :nausea_rating, :happiness_rating, :min_height))
    redirect_to @attraction
  end
  
  def edit
    @attraction = Attraction.find(params[:id])
  end
  
  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(params.require(:attraction).permit(:name, :tickets,
    :nausea_rating, :happiness_rating, :min_height))
    redirect_to attraction_path(@attraction.id)
  end
  
  def show
    @attraction = Attraction.find(params[:id])
  end
  
  def index 
    @user = current_user
  end
  
  def ride
    user = User.find(session[:user_id])
    attraction = Attraction.find(params[:id])
    ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
    ride.take_ride
    
    flash[:notice] = "Thanks for riding the #{attraction.name}!" if !ride.too_short? && !ride.not_enough_tickets?
    flash[:notice] = "You do not have enough tickets the #{attraction.name}" if ride.not_enough_tickets?
    flash[:notice] = "You are not tall enough to ride the #{attraction.name}" if ride.too_short?
    flash[:notice] = "You are not tall enough to ride the #{attraction.name}. 
    You do not have enough tickets the #{attraction.name}" if ride.too_short? && ride.not_enough_tickets?
    redirect_to user
  end
end
