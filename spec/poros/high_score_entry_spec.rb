require "rails_helper"

RSpec.describe HighScoreEntry do
  before(:each) do
    @user = create(:user, name: "User 1")
  end

  describe "attributes" do
    it "has a score, username, and id" do
      high_score_entry = HighScoreEntry.new(
        id: 1,
        number_correct: 10,
        user_id: @user.id
      )

      expect(high_score_entry.score).to eq(10)
      expect(high_score_entry.username).to eq("User 1")
      expect(high_score_entry.id).to eq(1)
    end
  end
end
