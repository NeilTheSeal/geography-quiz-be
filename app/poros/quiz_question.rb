class QuizQuestion
  attr_reader :question, :correct_answer, :options, :id, :image

  def initialize(params)
    @geography_data = params[:geography_data]
    @question = nil
    @correct_answer = nil
    @options = []
    @image = false
    @id = params[:id]
  end

  def self.generate20(geography_data)
    question_types = %w[
      capital
      flag
      borders
      landlocked
      population
      drive_side
      un_member
      area
      sub_region
      coat_of_arms
    ]

    return_questions(question_types, geography_data)
  end

  def self.return_questions(question_types, geography_data)
    questions = []

    20.times do |id|
      question_type = question_types.sample
      questions << create_question(question_type, geography_data, id)
    end

    questions
  end

  def self.create_question(question_type, geography_data, id)
    input_hash = { geography_data:, id: }
    case question_type
    when "capital"
      CapitalQuestion.new(input_hash)
    when "flag"
      FlagQuestion.new(input_hash)
    when "borders"
      BordersQuestion.new(input_hash)
    when "landlocked"
      LandlockedQuestion.new(input_hash)
    when "population"
      PopulationQuestion.new(input_hash)
    when "drive_side"
      DriveSideQuestion.new(input_hash)
    when "un_member"
      UnMemberQuestion.new(input_hash)
    when "area"
      AreaQuestion.new(input_hash)
    when "sub_region"
      SubRegionQuestion.new(input_hash)
    when "coat_of_arms"
      CoatOfArmsQuestion.new(input_hash)
    end
  end
end
