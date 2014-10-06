class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    
    @comment = Comment.new(comment_params)
    @comment.image_id = params[:image_id]
    @comments = @image.comments

    @gallery = @image.gallery
    
    if @comment.save
       redirect_to gallery_image_path(@gallery, @image)
    else
      render "images/show" # cannot use path helpers
    end

  end

  private

  def comment_params
    params.require(:comment).
      permit(:body).
      merge(user_id: current_user.id)
  end

end
