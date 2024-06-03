class FlagQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    countries = @geography_data.sample(4)

    @question = "What is the flag of #{countries[0].name[:common]}?"
    @correct_answer = countries[0].flag_url
    @options = countries.map { |country| country.flag_url }
    @options.shuffle!
  end
end
