class ApartmentsController < ApplicationController

  before_action :authenticate_user!, :only => :new

  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = Apartment.find(params[:id])
    @owner = @apartment.user
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user_id = current_user.id
    @apartment.save
    flash[:notif] = ">— Your apartment has been created with success —<"
    redirect_to apartments_path
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
     @apartment = Apartment.find(params[:id])
     @apartment.update(apartment_params)
     flash[:notif] = ">— Your apartment has been updated with success —<"
     redirect_to profile_path
  end

  def destroy
     @apartment = Apartment.find(params[:id])
     @apartment.destroy
     flash[:notice] = "The apartment '#{@apartment.title}’has been deleted !"
     redirect_to profile_path
  end


  private

  def apartment_params
    params.require(:apartment).permit(:title, :description, :price, :address, :zipcode, :city, :country, :picture)
  end

end
