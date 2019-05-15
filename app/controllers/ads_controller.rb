class AdsController < ApplicationController

before_action :authenticate_user!, except: [:index ,:show]

  def index
   @ads = Ad.published.paginate(page: params[:page], per_page: 5)
    @categories = Category.all
    @categorytypes = Categorytype.all
  end

  def myads
    @categories = Category.all
    @categorytypes = Categorytype.all
    if user_signed_in?
      @ads = current_user.ads.published
    end
  end

  def show
      @ad = Ad.find(params[:id])
  end
  def new
    @ad = current_user.ads.build
  end

  def create
    ad = current_user.ads.build(ad_params)
    ad.save
    redirect_to ads_path, alert: "Ad needs admin approuval"
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
    @ad.update(ad_params)
    redirect_to ads_path
  end

  private

   def ad_params
    params.require(:ad).permit(:title, :description, :price, :location, :category_id, images: [])
   end
end
