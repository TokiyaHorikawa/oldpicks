class AnswersController < ApplicationController
  def create
    @answer = Answer.create(snswer_params)
  end

  private

  def snswer_params
  end

end
