class RankingController < ApplicationController

  def user_ranking_page
    @article = Article.new
    @comment = Comment.new

    users = {}
    @users = User.all
    @users.each do |user|
      @count = 0
      user.comments.each do |comment|
        a = comment.like_counts.to_i
        @count += a
        users[user] = @count
      end
    end
    like_sort_users = Hash[ users.sort_by{ |_, v| -v } ]
    @like_sort_users = like_sort_users.to_a
  end

  def comment_ranking_page
    @article = Article.new
    @comment = Comment.new
    @comments = Comment.includes(:user).order("like_counts DESC").limit(20)
  end

  def about_users
    @article = Article.new
    @comment = Comment.new
    @users = User.limit(50)
  end

end
