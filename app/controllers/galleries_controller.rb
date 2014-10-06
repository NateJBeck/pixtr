#galleries_controller.rb        needs to be named exactly as it is
#class GalleriesController must be named exactly
#naming is important

class GalleriesController < ApplicationController #GalleriesController inherits from ApplicationController
  
  def index 
    #@galleries = Gallery.all
    @galleries = current_user.galleries.all
    #render :index      #can also leave it out, rails will render it automatically
    
  end

  def new
    @gallery = current_user.galleries.new  #@gallery is used in a/v/g/new.html.erb
    #render :new
  end

  def create
    # use ls <object> in PRY to find methods
    # STRONG PARAMS from gallery_para
    # ms needed to avoid mass assignment hack
    
    @gallery = current_user.galleries.new(gallery_params) 
    
    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      #redirect_to new_gallery_path
      render :new
    end
    
  #  DONT USE THE FOLLOWING:  
  #  Gallery.create(
  #    name: params[:gallery][:name],
  #    description: params[:gallery][:description]
  #  )
   
   #binding.pry -- using PRY gem to pause the actions here so we can inspect
   #redirect_to "/"
  end

  def show
    @gallery = load_gallery_from_url 
    #render :show
  end

  def edit
    @gallery = load_gallery_from_url
    #render :edit   DONE BY DEFAULT
  end

  def update
    @gallery = load_gallery_from_url
    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else 
      render :edit
    end
  end

  #BECAUSE PAGE DOES SOMETHING, REDIRECT SOMEWHERE ELSE TO AVOID REFRESH
  #PROBLEMS

  def destroy
    gallery = load_gallery_from_url
    gallery.destroy

    redirect_to "/"
  end
  
  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end

  def load_gallery_from_url
    current_user.galleries.find(params[:id])
  end
end

