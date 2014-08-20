class PicturesController < ApplicationController

  def index
    @apartment = Apartment.find(params[:apartment_id])

    @pictures = @apartment.pictures.all
    @picture = Picture.new

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
