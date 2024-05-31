class QuizResult < ApplicationRecord
  belongs_to :user
  validates :number_correct, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true
end
