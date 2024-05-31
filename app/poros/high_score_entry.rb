class HighScoreEntry
  attr_reader :score, :username, :id

  def initialize(id:, number_correct:, user_id:)
    @id = id
    @score = number_correct
    @username = User.find(user_id).name
  end
end
