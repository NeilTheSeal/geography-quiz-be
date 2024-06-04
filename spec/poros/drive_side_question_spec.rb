require "rails_helper"
require "json"

json_response = JSON.parse(
  File.read("./spec/resources/rest_countries.json"),
  symbolize_names: true
)

country_data = json_response.map do |country|
  Country.new(country)
end

RSpec.describe DriveSideQuestion do
  before(:each) do
    @drive_side_question = DriveSideQuestion.new({
      geography_data: country_data,
      id: 1
    })
  end

  describe "attributes" do
    it "has attributes" do
      expect(@drive_side_question.question).to be_a(String)
      expect(@drive_side_question.correct_answer).to be_a(String)
      expect(@drive_side_question.options).to be_an(Array)
      expect(@drive_side_question.options.length).to eq(2)
      expect(@drive_side_question.image).to eq(false)
      expect(@drive_side_question.id).to eq(1)
    end
  end
end
