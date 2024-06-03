require "rails_helper"

RSpec.describe "QuizQuestions", type: :request do
  it "returns 20 quiz questions" do
    VCR.use_cassette("quiz_questions", serialize_with: :json) do
      get "/api/v0/quiz-questions"

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)

      expect(json_response["data"].length).to eq(20)
      expect(json_response["data"].first["attributes"]).to be_a(Hash)
      expect(json_response["data"].first["attributes"]["question"]).to be_a(String)
      expect(json_response["data"].first["attributes"]["correct_answer"]).to be_a(String)
      expect(json_response["data"].first["attributes"]["options"]).to be_a(Array)
      expect(json_response["data"].first["attributes"]["options"].empty?).to eq(false)
      expect(json_response["data"].first["id"]).to be_a(String)
    end
  end
end
