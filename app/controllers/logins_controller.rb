class LoginsController < ApplicationController
  def new
  end
  def create
    traveler=Traveler.find_by(email: params[:email])
    if traveler && traveler.authenticate(params[:password])
      session[:traveler_id] = traveler.id
      flash[:success] = "You are logged in."
      redirect_to journeys_path
    else
      flash.now[:danger] = "Your email address and password does not match."
      render 'new'
    end
  end
  def destroy
    session[:traveler_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
end
