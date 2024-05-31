require "rails_helper"

RSpec.describe QuizResult, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :number_correct }
  it { should validate_numericality_of :number_correct }
  it { should validate_presence_of :user_id }
end
