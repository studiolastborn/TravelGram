class TravelersController < ApplicationController
  def new
    @traveler = Traveler.new
  end
  def create
      @traveler = Traveler.new(traveler_params)
        if @traveler.save
          flash[:success] = "Your account is successfully created!"
          redirect_to journeys_path
        else
          render :new
        end
  end
  def edit
      @traveler = Traveler.find(params[:id])
  end
  def update
      @traveler = Traveler.find(params[:id])
      if @traveler.update(traveler_params)
        flash[:success] = "Your profile has been updated!"
        redirect_to journeys_path #change to show chef page
      else
        render :edit
      end
  end
  def show
    @traveler = Traveler.find(params[:id])
  end
  
  private
    def traveler_params 
      params.require(:traveler).permit(:name, :email, :password)
    end
end