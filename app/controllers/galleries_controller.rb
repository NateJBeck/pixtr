#galleries_controller.rb        needs to be named exactly as it is
#class GalleriesController must be named exactly
#naming is important

class GalleriesController < ApplicationController #GalleriesController inherits from ApplicationController
  def index 
    @galleries = Gallery.all
    #render :index      #can also leave it out, rails will render it automatically
  end

  def new
    @gallery = Gallery.new  #@gallery is used in a/v/g/new.html.erb
    #render :new
  end

  def create
    # use ls <object> in PRY to find methods
    # STRONG PARAMS from gallery_para
    # ms needed to avoid mass assignment hack
    
    gallery = Gallery.create(gallery_params) 
    redirect_to gallery   #makes it gallery_path(gallery)
    
  #  DONT USE THE FOLLOWING:  
  #  Gallery.create(
  #    name: params[:gallery][:name],
  #    description: params[:gallery][:description]
  #  )
   
   #binding.pry -- using PRY gem to pause the actions here so we can inspect
   #redirect_to "/"
  end

  def show
    @galleries = Gallery.find(params[:id]) 
    #render :show
  end

  def edit
    @gallery = Gallery.find(params[:id])
    #render :edit   DONE BY DEFAULT
  end

  def update
    gallery = Gallery.find(params[:id])
    gallery.update(gallery_params)
    redirect_to "/"
  end

  #BECAUSE PAGE DOES SOMETHING, REDIRECT SOMEWHERE ELSE TO AVOID REFRESH
  #PROBLEMS

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy

    redirect_to "/"
  end
  
  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end

end
