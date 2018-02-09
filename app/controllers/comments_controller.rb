class CommentsController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def edit
  end

  def update
    @comment = Comment.find(params[:id])
    # @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id
    @article = @comment.article_id
    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, article_id: @article.id)
  end

end
