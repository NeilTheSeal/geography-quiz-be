class UnMemberQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    country = @geography_data.sample

    @question = "Is #{country.name[:common]} a member of the United Nations?"

    @correct_answer = country.un_member ? "Yes" : "No"
    @options = %w[Yes No]
  end
end
