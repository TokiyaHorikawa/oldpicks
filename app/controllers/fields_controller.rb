class FieldsController < ApplicationController
  before_action :set_user_article
  before_action :set_user_follow
  before_action :set_side_article

  def technology
    @tech_articles = Article.tagged_with("テクノロジー").order('comment_counts DESC').limit(10)
  end

  def business
    @business_articles = Article.tagged_with("ビジネス").order('comment_counts DESC').limit(10)
  end

  def economy
    @economy_articles = Article.tagged_with("政治").order('comment_counts DESC').limit(10)
  end

  def finance
    @finance_articles = Article.tagged_with("金融").order('comment_counts DESC').limit(10)
  end

  def career
    @career_articles = Article.tagged_with("キャリア").order('comment_counts DESC').limit(10)
  end

  def society
    @society_articles = Article.tagged_with("社会").order('comment_counts DESC').limit(10)
  end

  def job
    @job_articles = Article.tagged_with("ジョブ").order('comment_counts DESC').limit(10)
  end

  def set_user_article
    @article = Article.new
    @comment = Comment.new
    @latest_articles = Article.order('created_at DESC').limit(8)
  end

  def set_user_follow
    @user = User.find(current_user)
    @follow = @user.all_following
    @follower = @user.followers
  end

  def set_side_article
    if user_signed_in?
      @side_articles_login = Comment.where(user_id: current_user.all_following).includes(:article).order("id DESC").limit(10)
      @side_articles = Comment.includes(:user).includes(:article).order("id DESC").limit(10)
    end
  end

end
