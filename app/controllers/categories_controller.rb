class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @ads = @category.ads.published
    @categorytypes = Categorytype.all
    @categories = Category.all
  end

private

  def category_params
    params.require(:category).permit(:label, :categorytype_id)
  end

end
