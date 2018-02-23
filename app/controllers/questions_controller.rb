class QuestionsController < ApplicationController
  before_action :set_news, only: [:index, :show, :create]
  before_action :set_need, only: [:index, :show, :create]

  def index
  end

  def show
    @a_question = Question.find(params[:id])
  end

  def create
    questions = Question.create(question_params)
    redirect_to user_question_path(@user.id, questions.id)
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:content).merge(user_id: current_user.id)
  end

  def set_news
    @article = Article.new
    @comment = Comment.new
    @question = Question.new
    @answer = Answer.new
  end

  def set_need
    @user = User.find(params[:user_id])
    @answers = Answer.all.limit(10)
  end

end
