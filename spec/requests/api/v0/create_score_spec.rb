require "rails_helper"

RSpec.describe "create quiz results", type: :request do
  it "can add a quiz result through the api" do
    VCR.use_cassette("add_result", serialize_with: :json) do
      post(
        "/api/v0/high-scores", 
        params: {user_id: "1", number_correct: 20},
        headers: {Accept: "application/json"}
      )

      expect(response.location).to eq("http://localhost:3000/dashboard")
      expect(QuizResult.count).to eq(1)


    end
  end

  it "sad path invalid params" do 
    VCR.use_cassette("add_result_sad_path", serialize_with: :json) do
      post(
        "/api/v0/high-scores", 
        params: {user_id: "", number_correct: 20},
        headers: {Accept: "application/json"}
      )

      expect(response.status).to eq(422)
      expect(response.body).to eq("{\"errors\":[\"User can't be blank\"]}")
    end
  end
end
