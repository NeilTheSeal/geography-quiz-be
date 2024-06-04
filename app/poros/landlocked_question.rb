class LandlockedQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    country = @geography_data.sample

    @question = "Is #{country.name[:common]} landlocked?"
    @correct_answer = country.landlocked
    @options = [true, false]
  end
end
