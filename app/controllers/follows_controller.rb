class FollowsController < ApplicationController
  before_action :set_user_article

  def index
    @user = User.find(params[:user_id])
    @modal_articles = Article.where( user_id: @user ).order( "created_at DESC" ).limit(2)
    @follow = @user.all_following
    @follower = @user.followers
  end

  def create
    @following = User.find(follow_params[:user_id])
    current_user.follow(@following)
    @user = User.find(follow_params[:user_id])
    @follow_num = @user.follow_count
    @follower_num = @user.followers_count
    redirect_to :back
  end

  def destroy
    @followed = User.find(follow_params[:user_id])
    current_user.stop_following(@followed)
    @user = User.find(follow_params[:user_id])
    @follow_num = @user.follow_count
    @follower_num = @user.followers_count
    redirect_to :back
  end

  private
  def follow_params
    params.permit(:opponent_id, :user_id)
  end

  def set_user_article
    @article = Article.new
    @comment = Comment.new
  end
end
