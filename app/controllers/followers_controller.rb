class FollowersController < ApplicationController
  before_action :set_user_article

  def index
    @user = User.find(params[:user_id])
    @modal_articles = Article.where( user_id: @user ).order( "created_at DESC" ).limit(2)
    @follow = @user.all_following
    @follower = @user.followers
  end

  def set_user_article
    @article = Article.new
    @comment = Comment.new
  end

end
