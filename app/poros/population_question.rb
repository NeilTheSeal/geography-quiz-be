class PopulationQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    countries = @geography_data.sample(4)

    countries.map do |country|
      @question = "What country has the population of #{country.population}?"
    end

    @correct_answer = countries[0].population
    @options = countries.map { |country| country.population }
    @options.shuffle!
  end
end
