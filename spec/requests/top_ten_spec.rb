require "rails_helper"

RSpec.describe "TopTen" do
  before(:each) do
    @user_list = create_list(:user, 20)
    @score_list = []

    @user_list.each_with_index do |user, i|
      @score_list << create(:quiz_result, user:, number_correct: 20 - i)
    end
  end

  it "lists the top 10 high scores" do
    get "/high-scores"

    top_ten = @score_list.sort_by(&:number_correct).reverse[0..9]

    expect(JSON.parse(response.body, symbolize_names: true)[:data]).to eq(
      (0..9).map do |i|
        {
          attributes: {
            score: top_ten[i].number_correct,
            username: @user_list[i].name
          },
          id: top_ten[i].id.to_s,
          type: "high_scores"
        }
      end
    )
  end
end
