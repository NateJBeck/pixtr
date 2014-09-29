#galleries_controller.rb        needs to be named exactly as it is
#class GalleriesController must be named exactly
#naming is important

class GalleriesController < ApplicationController #GalleriesController inherits from ApplicationController
  def index 
    render :index      #can also leave it out, rails will render it automatically
  end

  def new
    @gallery = Gallery.new  #@gallery is used in a/v/g/new.html.erb
    render :new
  end

  def create
    Gallery.create(
      name: params[:gallery][:name],
      description: params[:gallery][:description]
    )
    redirect_to "/"
  end
end
