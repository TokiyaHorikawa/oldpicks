class QuestionsController < ApplicationController
  before_action :set_nes, only: [:index, :show]

  def index

  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_news
    @article = Article.new
    @comment = Comment.new
    @question = Question.new
    @answer = Answer.new
  end

  def set_need
    @user = User.find(params[:id])
    @ansers = Answer.all.limit(10)
  end

end
