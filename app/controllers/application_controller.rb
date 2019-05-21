class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?

   protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :phone_number, :gender, :birthday_on, :email, :password, :avatar)}

       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :phone_number, :gender, :birthday_on, :email, :password, :current_password, :avatar)}
    end

    def show
      @categories = Category.all
    end

    def favorite_text
      return @favorite_exists ? "<i class=“fa fa-star-o”></i>" : "<i class=“fa fa-star”></i>"
    end

    helper_method :favorite_text
end
