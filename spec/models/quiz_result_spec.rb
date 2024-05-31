require "rails_helper"

RSpec.describe QuizResult, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :number_correct }
  it { should validate_numericality_of :number_correct }
  it { should validate_presence_of :user_id }

  describe ".high_scores" do
    it "returns the top 10 scores" do
      user = create(:user)
      11.times do |i|
        create(:quiz_result, number_correct: i, user:)
      end

      high_scores = QuizResult.high_scores

      expect(high_scores.length).to eq 10
      expect(high_scores.first.score).to eq 10
      expect(high_scores.last.score).to eq 1
      expect(high_scores.first.username).to eq user.name
    end
  end
end
