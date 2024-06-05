require 'rails_helper'

RSpec.describe 'previous score' do
  before(:each) do
    @scores = create_list(:quiz_result, 5, user_id: "1")
    @scores_2 = create_list(:quiz_result, 5, user_id: "2")
  end

  it 'gives the previous scores in chronologic order' do
    get "/api/v0/previous-scores", params: { user_id: "1" }
    

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data.length).to eq(5)
    expect(data.first[:attributes]).to eq({user_id: "1", number_correct: @scores.first.number_correct})
  end
end