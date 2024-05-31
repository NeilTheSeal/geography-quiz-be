class HighScoresController < ApplicationController
  def index
    high_scores = QuizResult.high_scores
    render json: HighScoresSerializer.new(high_scores)
  end
end
