class Api::V0::PreviousScoresController < ApplicationController
  def index
    scores = QuizResult.find_scores(params[:user_id])
    render json: HighScoresSerializer.new(scores)
  end
end
