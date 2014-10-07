class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
   # @comment.image_id = params[:image_id]

    @gallery = @image.gallery
    
    if @comment.save
       redirect_to gallery_image_path(@gallery, @image)
    else
      @comments = @image.comments.recent
      #grab all the things from within the database, using self.recent in model
      render "images/show" # cannot use path helpers
    end

  end

  private

  def comment_params
    params.require(:comment).
      permit(:body).
      merge(user_id: current_user.id) #associates the comment to the user that is currently signed in, maing the comment
  end

end
