class WelcomeController < ApplicationController
  def index
  end
  def about
    @categories = Category.all
  end
  def contact
    @categories = Category.all
  end
end
