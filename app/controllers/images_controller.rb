class ImagesController < ApplicationController
  def show
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new
  end

  #def create
  #  gallery = Gallery.find(params[:gallery_id])
  #  image = @gallery.images.create(gallery, image_params)
  #  redirect_to 
  #end

  #private
  #
  #def gallery_params
  #  params.require(:gallery).permit(:name, :description)
  #end

  #def image_params
  #  params.require(:image).permit(:name, :url)
  #end

end
