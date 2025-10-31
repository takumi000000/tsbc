class AnswersController < ApplicationController
  def index
    @questions = Question.where(q_id: 2).order(:id)
    @answers = Answer.includes(:subject).filter(&:evaluation_response?)
  end
end
