class PagesController < ApplicationController
  def home
    redirect_to journeys_path if logged_in?
  end
end