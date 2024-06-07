class CoatOfArmsQuestion < QuizQuestion
  def initialize(params)
    super
    @image = true
    generate_question
  end

  private

  def generate_question
    countries = @geography_data.sample(4)

    if countries.any? { |country| country.coat_of_arms_url.nil? }
      generate_question
      return
    end

    @question = "What is the coat of arms of #{countries[0].name[:common]}?"
    @correct_answer = countries[0].coat_of_arms_url
    @options = countries.map(&:coat_of_arms_url)
    @options.shuffle!
  end
end
