require "rails_helper"
require "json"

json_response = JSON.parse(
  File.read("./spec/resources/rest_countries.json"),
  symbolize_names: true
)

country_data = json_response.map do |country|
  Country.new(country)
end

RSpec.describe QuizQuestion do
  before(:each) do
    @quiz_question = QuizQuestion.new({
      geography_data: country_data,
      id: 1
    })
  end

  describe "attributes" do
    it "has attributes" do
      expect(@quiz_question).to have_attributes(
        question: nil,
        correct_answer: nil,
        options: [],
        image: false,
        id: 1
      )
    end
  end

  describe "class methods" do
    it "can generate 20 questions" do
      questions = QuizQuestion.generate20(country_data)

      expect(questions.length).to eq(20)
      expect(questions.first).to be_a(QuizQuestion)
      expect(questions.last).to be_a(QuizQuestion)
    end

    it "can return a question" do
      question = QuizQuestion.create_question("capital", country_data, 1)

      expect(question).to be_a(CapitalQuestion)
    end
  end
end
