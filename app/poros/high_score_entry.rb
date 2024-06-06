class HighScoreEntry
  attr_reader :number_correct, :user_id, :id, :created_at

  def initialize(id:, number_correct:, user_id:, created_at:)
    @id = id
    @number_correct = number_correct
    @user_id = user_id
    @created_at = created_at
  end
end
