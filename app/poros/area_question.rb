class AreaQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    country = @geography_data.sample

    @question = "What is the area of #{country.name[:common]}?"

    @correct_answer = "#{country.area.to_i} km\u00B2"
    @options = generate_options
  end

  def generate_options
    options = [@correct_answer]

    min_exp = Math.log10(10_000).to_f
    max_exp = Math.log10(10_000_000).to_f

    3.times do
      rand_exp = rand * (max_exp - min_exp) + min_exp
      area = (10.0**rand_exp).to_i

      area_with_commas = area.to_s.reverse.gsub(
        /(\d{3})(?=\d)/,
        '\\1,'
      ).reverse

      options << "#{area_with_commas} km\u00B2"
    end

    options.shuffle
  end
end
