require "rails_helper"
require "json"

json_response = JSON.parse(
  File.read("./spec/resources/rest_countries.json"),
  symbolize_names: true
)

country_data = json_response.map do |country|
  Country.new(country)
end

RSpec.describe LandlockedQuestion do
  before(:each) do
    @landlocked_question = LandlockedQuestion.new({
      geography_data: country_data,
      id: 1
    })
  end

  describe "attributes" do
    it "has attributes" do
      expect(@landlocked_question.question).to be_a(String)
      expect(@landlocked_question.correct_answer.nil?).to eq(false)
      expect(@landlocked_question.options).to be_an(Array)
      expect(@landlocked_question.options).to eq([true, false])
      expect(@landlocked_question.image).to eq(false)
      expect(@landlocked_question.id).to eq(1)
    end
  end
end
