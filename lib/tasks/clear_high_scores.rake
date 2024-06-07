namespace :clear do
  desc "Clear the high scores entries in production database"
  task db: :environment do
    QuizResult.destroy_all
  end
end
