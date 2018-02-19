class ArticlesController < ApplicationController
  before_action :set_like_sort, only: [:index]
  before_action :set_user_comment, only: [:index, :show]

  def index
    @article = Article.new
    @comments = Comment.includes(:user).order("like_counts DESC").limit(4)
    @head_articles = Article.where(params[:id]).limit(2)
    @top_articles = Article.where(params[:id]).limit(4)
    @latest_articles = Article.order('created_at DESC').limit(8)
    @tech_articles = Article.tagged_with("テクノロジー").limit(3)
    @business_articles = Article.tagged_with("ビジネス").limit(3)
    @economy_articles = Article.tagged_with("政治").limit(3)
    @finance_articles = Article.tagged_with("金融").limit(3)
    @career_articles = Article.tagged_with("キャリア").limit(3)
    @society_articles = Article.tagged_with("社会").limit(3)
    @job_articles = Article.tagged_with("ジョブ").limit(3)
    @back_number_articles = Article.tagged_with("過去記事").limit(3)
    @analysis_articles = Article.tagged_with("アナリスト").limit(3)

    if user_signed_in?
      @user = User.find(current_user.id)
      @follow = @user.all_following
      @follower = @user.followers
    end
  end

  def new
  end

  def create
    @article = Article.create(article_params)
    @comments = @article.comments.new(comment_params)
    if @comments.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.where(params[:id]).order("created_at DESC").limit(6)
    @comments = @article.comments.includes(:user).order("like_counts DESC").limit(3)
    @new_comments = @article.comments.includes(:user).order("created_at DESC").limit(12)
    
    if user_signed_in?
      @your_comment = Comment.find_by(user_id: current_user.id, article_id: @article.id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @article = Article.new
    @comment = Comment.new
    @articles = Article.search(params[:key].first)
  end


  private

    def article_params
      params.require(:article).permit(:url, :title, :description, :image, :site_name, :tag_list).merge(user_id: current_user.id)
    end


    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

    def set_user_comment
      @comment = Comment.new
    end

    def set_like_sort
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
      @like_sort_users = like_sort_users.to_a.take(4)
    end

end
