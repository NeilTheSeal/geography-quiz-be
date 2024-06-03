class BordersQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  def generate_question
    countries = @geography_data.sample(4)

    if countries.any? do |country|
         country.borders.nil? || country.borders.empty?
       end
      generate_question
      return
    end

    bordering_countries = countries[0].borders.map do |cca3|
      CountryCodes.country_name[cca3.to_sym]
    end

    str = ""

    case bordering_countries.length
    when 0
      "no countries"
    when 1
      str += "only #{bordering_countries[0]}"
    when 2
      str += "#{bordering_countries[0]} and #{bordering_countries[1]}"
    else
      str += bordering_countries[0..bordering_countries.length - 2].join(", ")
      str += " and #{bordering_countries.last}"
    end

    @question = "Which country borders #{str}?"
    @correct_answer = countries[0].name[:common]
    @options = countries.map { |country| country.name[:common] }
    @options.shuffle!
  end
end
