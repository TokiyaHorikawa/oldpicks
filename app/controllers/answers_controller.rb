class AnswersController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @answers = Answer.create(answer_params)
    redirect_to user_questions_path(user.id)
  end

  private
  def answer_params
    params.require(:answer).permit(:content).merge(question_id: params[:question_id], user_id: current_user.id)
  end
end
