class AdsController < ApplicationController

before_action :authenticate_user!, except: [:index ,:show]

  def index
    @ads = Ad.all
  end

  def myads
    if user_signed_in?
      @ads = current_user.ads
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = current_user.ads.build
  end

  def create
    ad_params = params.require(:ad).permit(:title, :description, :price, :location)
    ad = current_user.ads.build(ad_params)
    ad.save
    redirect_to ad_path (ad.id)
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_path
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    ad_params = params.require(:ad).permit(:title, :description, :price, :location)
    @ad.update(ad_params)
    redirect_to ads_path
  end

end
