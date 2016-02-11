class JourneysController < ApplicationController
    def index
      @journeys=Journey.all
    end
    def show
      @journey=Journey.find(params[:id])
    end
    def new
      @journey=Journey.new
    end
    def create
      @journey=Journey.new(journey_params)
      @journey.traveler = Traveler.find(1)
        if @journey.save
          flash[:success] = "Your journey was posted successfully!"
          redirect_to journeys_path
        else
          render :new
        end
    end
    def edit
      @journey=Journey.find(params[:id])
    end
    def update
      @journey=Journey.find(params[:id])
      if @journey.update(journey_params)
        flash[:success] = "Your journey was edited successfully!"
        redirect_to journey_path(@journey)
      else
        render :edit
      end
    end
    
    
    private
      def journey_params
        params.require(:journey).permit(:title, :location, :description)
      end
end