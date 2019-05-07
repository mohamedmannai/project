class WelcomeController < ApplicationController
  def index
  end
  def about
    @categories = Category.all
    @categorytypes = Categorytype.all
  end
  def contact
    @categories = Category.all
    @categorytypes = Categorytype.all
  end
end
