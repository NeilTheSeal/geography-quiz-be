class Api::V0::HomeController < ApplicationController
  def index
    render plain: "Welcome to the Geography Quiz API version 0. " \
    "Please refer to the documentation for usage instructions. " \
    "https://github.com/NeilTheSeal/geography-quiz-be"
  end
end
