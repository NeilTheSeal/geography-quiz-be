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
    ]

    # question_type = "drive_side"

    questions = []

    20.times do |id|
      question_type = question_types.sample
      questions << return_question(question_type, geography_data, id)
    end

    questions
  end

  def self.return_question(question_type, geography_data, id)
    case question_type
    when "capital"
      CapitalQuestion.new({
        geography_data:,
        id:
      })
    when "flag"
      FlagQuestion.new({
        geography_data:,
        id:
      })
    when "borders"
      BordersQuestion.new({
        geography_data:,
        id:
      })
    when "landlocked"
      LandlockedQuestion.new({
        geography_data:,
        id:
      })
    when "population"
      PopulationQuestion.new({
        geography_data:,
        id:
      })
    when "drive_side"
      DriveSideQuestion.new({
        geography_data:,
        id:
      })
    end
  end
end
