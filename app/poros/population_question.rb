class PopulationQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    countries = @geography_data.sample(4)

    population = population_with_commas(countries[0].population)

    @question = "What country has the population of #{population}?"

    @correct_answer = countries[0].name[:common]
    @options = countries.map { |country| country.name[:common] }
    @options.shuffle!
  end

  def population_with_commas(population)
    population.to_s.reverse.gsub(
      /(\d{3})(?=\d)/,
      '\\1,'
    ).reverse
  end
end
