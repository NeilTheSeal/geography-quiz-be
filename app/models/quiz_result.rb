class QuizResult < ApplicationRecord
  validates :number_correct,
            presence: true,
            numericality: { only_integer: true }
  validates :user_id, presence: true

  def self.high_scores
    scores = order(number_correct: :desc).limit(10)
    scores.map do |score|
      HighScoreEntry.new(
        id: score.id,
        number_correct: score.number_correct,
        user_id: score.user_id
      )
    end
  end
end
