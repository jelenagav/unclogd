class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :quiz, :items]

  def home
  end

  def quiz
    @package = Package.new(quiz_results: "<25,female,normal,rarely,acne,Biological")
  end
end
