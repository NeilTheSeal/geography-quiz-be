class LandlockedQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    countries = @geography_data.sample(4)

    @question = "What country is landlocked?"
    @correct_answer = countries[0].landlocked == true
    @options = countries.map { |country| country.landlocked }
    @options.shuffle!
  end
end