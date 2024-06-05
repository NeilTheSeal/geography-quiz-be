class HighScoreEntry
  attr_reader :number_correct, :user_id, :id

  def initialize(id:, number_correct:, user_id:)
    @id = id
    @number_correct = number_correct
    @user_id = user_id
  end
end
