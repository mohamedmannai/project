class AdsController < ApplicationController

before_action :authenticate_user!, except: [:index ,:show]

  def index
    if params[:search]
    @ads = Ad.search(params[:search]).published.paginate(page: params[:page], per_page: 5)
    @categories = Category.all
    @categorytypes = Categorytype.all
  else
   @ads = Ad.published.paginate(page: params[:page], per_page: 5)
    @categories = Category.all
    @categorytypes = Categorytype.all
  end
  end

  def myads
    @categories = Category.all
    @categorytypes = Categorytype.all
    if user_signed_in?
      @ads = current_user.ads.published.paginate(page: params[:page], per_page: 5)
    end
  end
  def myfavads
    @categories = Category.all
    @categorytypes = Categorytype.all
    @ads = Ad.published.paginate(page: params[:page], per_page: 5)
  end

  def show
      @ad = Ad.find(params[:id])
      @favorite_exists = Favorite.where(ad: @ad, user: current_user) == [] ? false : true
  end

  def new
    @ad = current_user.ads.build
  end

  def create
    ad = current_user.ads.build(ad_params)
    if ad.save
    redirect_to ads_path, alert: "Ad needs admin approuval"
  else
    render :new
  end
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
    @ad.update(ad_params) && @ad.update(publishing_at: nil)
    redirect_to ads_path, alert: "Modification needs admin approuval"
  end

  private

   def ad_params
    params.require(:ad).permit(:title, :description, :price, :location, :category_id, images: [])
   end
end
