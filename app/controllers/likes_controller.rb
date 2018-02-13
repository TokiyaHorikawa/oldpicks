class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.create(user_id: current_user.id, comment_id: params[:comment_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @like.destroy
  end

  private

  def set_variables
    @comment = Comment.find(params[:comment_id])
    @id_name = "#like-#{@comment.id}"
    @id_image = "#image-#{@comment.id}"
  end
end
