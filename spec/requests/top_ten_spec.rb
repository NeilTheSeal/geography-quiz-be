require "rails_helper"

RSpec.describe "TopTen" do
  before(:each) do
    @score_list = []

    11.times do |i|
      @score_list << create(:quiz_result, user_id: i, number_correct: 20 - i)
    end
  end

  it "lists the top 10 high scores" do
    get "/api/v0/high-scores"

    top_ten = @score_list.sort_by(&:number_correct).reverse[0..9]

    expect(JSON.parse(response.body, symbolize_names: true)[:data]).to eq(
      (0..9).map do |i|
        {
          attributes: {
            number_correct: top_ten[i].number_correct,
            user_id: i.to_s
          },
          id: top_ten[i].id.to_s,
          type: "high_scores"
        }
      end
    )
  end
end
