class DriveSideQuestion < QuizQuestion
  def initialize(params)
    super
    generate_question
  end

  private

  def generate_question
    country = @geography_data.sample

    @question = "What side of the road does #{country.name[:common]} drive on?"
    @correct_answer = country.drive_side
    @options = %w[left right]
  end
end
