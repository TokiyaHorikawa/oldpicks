class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.create(user_id: current_user.id, comment_id: params[:comment_id])
    redirect_to :back
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @like.destroy
    redirect_to :back
  end

  private

  def set_variables
    @comment = Comment.find(params[:comment_id])

  # like機能の非同期時に使用する変数
    # @id_name = "#like-#{@comment.id}"
    # @id_image = "#image-#{@comment.id}"
  end
end
