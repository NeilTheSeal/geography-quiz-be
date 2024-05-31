require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :quiz_results }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id_token }
end
