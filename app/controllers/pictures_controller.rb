class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    @picture = Picture.new
    @apartment = Apartment.find(params[:apartment_id])
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @apartment.pictures.create(picture_params)
    redirect_to apartment_pictures_path
  end

  def destroy
    @apartment = Apartment.find(params[:apartment_id])
    @picture = @apartment.pictures.find(params[:id])
    @picture.destroy
    redirect_to apartment_pictures_path
  end




  private

  def picture_params
    params.require(:picture).permit(:apartment_id, :picture)
  end

end
