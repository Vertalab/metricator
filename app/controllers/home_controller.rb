class HomeController < ApplicationController
  def index
    redirect_to Integration if current_user
  end
end
