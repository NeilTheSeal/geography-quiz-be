class BordersQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  def generate_question
    countries = @geography_data.sample(4)

    if country_has_no_bordering_countries?(countries)
      generate_question
      return
    end

    bordering_countries = correct_answer_bordering_countries(countries)

    str = format_bordering_countries(bordering_countries)

    @question = "Which country borders #{str}?"
    @correct_answer = countries[0].name[:common]
    @options = countries.map { |country| country.name[:common] }.shuffle
  end

  private

  def format_bordering_countries(countries)
    case countries.length
    when 0
      "no countries"
    when 1
      "only #{countries[0]}"
    when 2
      "#{countries[0]} and #{countries[1]}"
    else
      countries[0..countries.length - 2].join(", ") + " and #{countries.last}"
    end
  end

  def country_has_no_bordering_countries?(countries)
    countries.any? do |country|
      country.borders.nil? || country.borders.empty?
    end
  end

  def correct_answer_bordering_countries(countries)
    countries[0].borders.map do |cca3|
      CountryCodes.country_name[cca3.to_sym]
    end
  end
end
