require "rails_helper"
require "json"

json_response = JSON.parse(
  File.read("./spec/resources/rest_countries.json"),
  symbolize_names: true
)

country_data = json_response.map do |country|
  Country.new(country)
end

RSpec.describe CapitalQuestion do
  before(:each) do
    @capital_question = CapitalQuestion.new({
      geography_data: country_data,
      id: 1
    })
  end

  describe "attributes" do
    it "has attributes" do
      expect(@capital_question.question).to be_a(String)
      expect(@capital_question.correct_answer).to be_a(String)
      expect(@capital_question.options).to be_an(Array)
      expect(@capital_question.options.empty?).to eq(false)
      expect(@capital_question.image).to eq(false)
      expect(@capital_question.id).to eq(1)
    end
  end
end
