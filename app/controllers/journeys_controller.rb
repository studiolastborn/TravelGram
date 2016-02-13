class JourneysController < ApplicationController
  
    before_action :set_journey, only: [:show, :edit, :update]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update]
  
    def index
      @journeys=Journey.paginate(page: params[:page], per_page: 9)
    end
    
    def show
      
    end
    
    def new
      @journey=Journey.new
    end
    
    def create
      @journey=Journey.new(journey_params)
      @journey.traveler = current_user
        if @journey.save
          flash[:success] = "Your journey was posted successfully!"
          redirect_to journeys_path
        else
          render :new
        end
    end
    
    def edit
      
    end
    
    def update
      if @journey.update(journey_params)
        flash[:success] = "Your journey was edited successfully!"
        redirect_to journey_path(@journey)
      else
        render :edit
      end
    end
    
    
    private
      def journey_params
        params.require(:journey).permit(:title, :location, :description, :picture)
      end
      def set_journey
        @journey=Journey.find(params[:id])
      end
      def require_same_user
      if current_user != @journey.traveler
        flash[:danger] = "You can only edit your journey"
        redirect_to root_path
      end
      end
end