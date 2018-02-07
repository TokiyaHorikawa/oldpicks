class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, article_id: @article.id)
  end

end
