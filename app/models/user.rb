class User < ApplicationRecord
  has_many :quiz_results
  validates :name, presence: true
  validates :user_id_token, presence: true
end
