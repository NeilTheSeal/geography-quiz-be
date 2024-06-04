require "rails_helper"
require "json"

json_response = JSON.parse(
  File.read("./spec/resources/rest_countries.json"),
  symbolize_names: true
)

country_data = json_response.map do |country|
  Country.new(country)
end

RSpec.describe FlagQuestion do
  before(:each) do
    @flag_question = FlagQuestion.new({
      geography_data: country_data,
      id: 1
    })
  end

  describe "attributes" do
    it "has attributes" do
      expect(@flag_question.question).to be_a(String)
      expect(@flag_question.correct_answer).to be_a(String)
      expect(@flag_question.options).to be_an(Array)
      expect(@flag_question.options.empty?).to eq(false)
      expect(@flag_question.image).to eq(true)
      expect(@flag_question.id).to eq(1)
    end
  end
end
