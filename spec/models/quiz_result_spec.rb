require "rails_helper"

RSpec.describe QuizResult, type: :model do
  it { should validate_presence_of :number_correct }
  it { should validate_numericality_of :number_correct }
  it { should validate_presence_of :user_id }

  describe ".high_scores" do
    it "returns the top 10 scores" do
      11.times do |i|
        create(
          :quiz_result,
          number_correct: i,
          user_id: i
        )
      end

      high_scores = QuizResult.high_scores

      expect(high_scores.length).to eq 10
      expect(high_scores.first.number_correct).to eq 10
      expect(high_scores.last.number_correct).to eq 1
      expect(high_scores.first.user_id).to eq "10"
    end
  end

  describe '.previous_scores' do
    it "returns previous scores" do
      2.times do |i|
        create(
          :quiz_result,
          number_correct: i,
          user_id: "1"
        )
      end
      2.times do |i|
        create(
          :quiz_result,
          number_correct: i,
          user_id: "2"
        )
      end

      scores = QuizResult.find_scores("1")

      expect(scores.length).to eq 2
      expect(scores.first.number_correct).to eq 0
      expect(scores.last.number_correct).to eq 1
      expect(scores.first.user_id).to eq "1"
    end
  end
end
