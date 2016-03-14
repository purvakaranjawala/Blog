class WelcomeController < ApplicationController
  def index
  end

  def say_welcome
  	@article = Article.all
  end
end
