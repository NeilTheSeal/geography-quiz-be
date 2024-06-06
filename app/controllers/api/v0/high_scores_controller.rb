class Api::V0::HighScoresController < ApplicationController
  def index
    high_scores = QuizResult.high_scores
    render json: HighScoresSerializer.new(high_scores)
  end

  def create
    quiz_result = QuizResult.new(quiz_result_params)
    if quiz_result.save
      if Rails.env.production?
        redirect_to "https://secret-citadel-94988-86e2ffef1cda.herokuapp.com/dashboard"
      else
        redirect_to "http://localhost:3000/dashboard"
      end
    else
      render json: { errors: quiz_result.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def quiz_result_params
    params.permit(:user_id, :number_correct)
  end
end
