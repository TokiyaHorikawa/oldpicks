class ArticlesController < ApplicationController
  # 繰り返し使われる変数はbefore_actionに定義する

  def index
    @article = Article.new
    @comment = Comment.new
    @articles = Article.where(params[:id]).limit(4)
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
      params.require(:article).permit(:url, :title, :description, :image, :site_name).merge(user_id: current_user.id)
    end


    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

end
