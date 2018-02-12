class ArticlesController < ApplicationController
  # 繰り返し使われる変数はbefore_actionに定義する

  def index
    @article = Article.new
    @comment = Comment.new
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
    @comment = Comment.new
    @comments = @article.comments.includes(:user)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def article_params
      params.require(:article).permit(:url, :title, :description, :image, :site_name, :tag_list).merge(user_id: current_user.id)
    end


    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

end
