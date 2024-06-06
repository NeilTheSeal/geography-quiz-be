require "rails_helper"

RSpec.describe HighScoreEntry do
  describe "attributes" do
    it "has a score, username, and id" do
      high_score_entry = HighScoreEntry.new(
        id: 1,
        number_correct: 10,
        user_id: "999999999",
        created_at: "2024-01-01 00:00:00"
      )

      expect(high_score_entry.number_correct).to eq(10)
      expect(high_score_entry.id).to eq(1)
      expect(high_score_entry.user_id).to eq("999999999")
      expect(high_score_entry.created_at).to eq("2024-01-01 00:00:00")
    end
  end
end
