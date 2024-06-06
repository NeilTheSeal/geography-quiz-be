# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

QuizResult.create!(user_id: "1", number_correct: 20, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "1", number_correct: 18, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "1", number_correct: 16, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "1", number_correct: 14, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "2", number_correct: 12, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "2", number_correct: 10, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "2", number_correct: 8, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "2", number_correct: 6, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "3", number_correct: 4, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "3", number_correct: 2, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "3", number_correct: 1, created_at: "2024-01-01 00:00:00")
QuizResult.create!(user_id: "3", number_correct: 0, created_at: "2024-01-01 00:00:00")