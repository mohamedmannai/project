class FavoritesController < ApplicationController

  def update
    favorite = Favorite.where(ad: Ad.find(params[:ad]), user: current_user)
    if favorite == []
      Favorite.create(ad: Ad.find(params[:ad]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end
    respond_to do |format|
       format.html {}
       format.js {render inline: "location.reload();" }
     end
  end
end
