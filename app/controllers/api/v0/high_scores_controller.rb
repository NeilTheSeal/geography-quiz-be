class Api::V0::HighScoresController < ApplicationController
  def index
    high_scores = QuizResult.high_scores
    render json: HighScoresSerializer.new(high_scores)
  end

  def create
    unless valid_user?
      render json: {
        errors: ["You are not authorized to submit a quiz result"]
      }, status: :unauthorized
      return
    end
    quiz_result = QuizResult.new(quiz_result_params)
    if quiz_result.save
      handle_redirects
    else
      render json: {
        errors: quiz_result.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def quiz_result_params
    params.permit(:user_id, :number_correct)
  end

  def handle_redirects
    if Rails.env.production?
      redirect_to(
        "https://secret-citadel-94988-86e2ffef1cda.herokuapp.com/dashboard",
        allow_other_host: true
      )
    else
      redirect_to "http://localhost:3000/dashboard", allow_other_host: true
    end
  end

  def valid_user?
    UsersService.new.valid_user?(params[:user_id])
  end
end
