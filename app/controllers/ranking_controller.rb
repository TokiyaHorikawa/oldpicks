class RankingController < ApplicationController
  before_action :set_user_article
  before_action :set_user_follow

  def user_ranking_page
    users = {}
    @users = User.all
    @users.each do |user|
      count = 0
      user.comments.each do |comment|
        a = comment.like_counts.to_i
        count += a
        users[user] = count
      end
    end
    like_sort_users = Hash[ users.sort_by{ |_, v| -v } ]
    @like_sort_users = like_sort_users.to_a
  end

  def comment_ranking_page
    @comments = Comment.includes(:user).order("like_counts DESC").limit(20)
  end

  def about_users
    @users = User.all
  end

  def set_user_article
    @article = Article.new
    @comment = Comment.new
  end

  def set_user_follow
    @user = User.find(current_user)
    @follow = @user.all_following
    @follower = @user.followers
  end

end
