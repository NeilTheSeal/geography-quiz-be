Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v0 do
      get "/", to: "home#index"
      get "/high-scores", to: "high_scores#index"
      get "/quiz-questions", to: "quiz_questions#index"
      get "/previous-scores", to: "previous_scores#index"
      post "/high-scores", to: "high_scores#create"
    end
  end
end
