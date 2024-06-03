class Api::V0::QuizQuestionsController < ApplicationController
  def index
    questions = QuizQuestion.generate20(country_data)
    render json: QuestionsSerializer.new(questions)
  end

  private

  def country_data
    Rails.cache.fetch("country_data", expires_in: 7.days) do
      RestCountriesService.all_countries
    rescue Net::ReadTimeout
      country_data
    end
  end
end
