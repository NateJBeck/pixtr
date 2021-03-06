class ImagesController < ApplicationController
  def show
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.recent
  end

  def new
    @gallery = load_gallery_from_url
    @image = @gallery.images.new
  end

  def create
    @gallery = load_gallery_from_current_user
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @gallery = load_gallery_from_current_user
    @image = @gallery.images.find(params[:id])
    @user = @gallery.user
  end

  def update
    @gallery = load_gallery_from_current_user
    @image = @gallery.images.find(params[:id])
    
    if @image.update(image_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end

  def destroy
    @gallery = load_gallery_from_current_user
    @image = @gallery.images.find(params[:id])
    @image.destroy

    redirect_to @gallery
  end

  private
  
  def image_params
    params.require(:image).permit(:name, :url)
  end

  def load_gallery_from_url
    Gallery.find(params[:gallery_id])
    #current_user.galleries.find(params[:gallery_id])
  end

  def load_gallery_from_current_user
    current_user.galleries.find(params[:gallery_id])
  end

end
