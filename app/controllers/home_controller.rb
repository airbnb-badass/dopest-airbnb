class HomeController < ApplicationController

  def index
    @apartments = Apartment.all
  end

end
