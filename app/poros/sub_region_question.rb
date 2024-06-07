class SubRegionQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    country = @geography_data.sample
    sub_region_options = generate_sub_regions.push(country.sub_region)
    sub_region_candidate = sub_region_options.sample

    @question = "Is #{country.name[:common]} in #{sub_region_candidate}?"
    @correct_answer = sub_region_candidate == country.sub_region ? "Yes" : "No"
    @options = %w[Yes No]
  end

  def generate_sub_regions
    sub_regions = @geography_data.map do |country|
      country.sub_region
    end

    sub_regions.sample(2)
  end
end
