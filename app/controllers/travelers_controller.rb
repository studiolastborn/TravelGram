class TravelersController < ApplicationController
    #execute in order before edit and update actions
  before_action :set_traveler, only: [:update, :edit, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  def new
    @traveler = Traveler.new
  end
  
  def create
      @traveler = Traveler.new(traveler_params)
        if @traveler.save
          flash[:success] = "Your account is successfully created!"
          session[:traveler_id] = @traveler.id
          redirect_to journeys_path
        else
          render 'new'
        end
  end
  
  def edit
    
  end
  
  def update
      if @traveler.update(traveler_params)
        flash[:success] = "Your profile has been updated!"
        redirect_to traveler_path(@traveler) #change to show chef page
      else
        render 'edit'
      end
  end
  def show
    @journeys = @traveler.journeys.paginate(page: params[:page], per_page: 9)
  end
  
  private
    def traveler_params 
      params.require(:traveler).permit(:name, :email, :password)
    end
    
    def require_same_user
      if current_user != @traveler
        flash[:danger] = "You can only edit your profile"
        redirect_to root_path
      end
    end
    
    def set_traveler
      @traveler = Traveler.find(params[:id])
    end
end