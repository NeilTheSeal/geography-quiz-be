class CapitalQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    countries = @geography_data.sample(4)

    if countries.any? { |country| country.capital.nil? }
      generate_question
      return
    end

    @question = "What is the capital of #{countries[0].name[:common]}?"
    @correct_answer = countries[0].capital[0]
    @options = countries.map { |country| country.capital[0] }
    @options.shuffle!
  end
end
