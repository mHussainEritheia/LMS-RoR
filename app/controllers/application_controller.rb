class ApplicationController < ActionController::Base
     before_action :authenticate_user!
     protect_from_forgery with: :exception
     
     before_action :configure_permitted_parameters, if: :devise_controller?
     
     def after_sign_in_path_for(resource)
          if current_user.role_id === 1
               admin_book_categories_path
          else
               reader_book_categories_path
          end
     end
     
     protected
     
     def configure_permitted_parameters
          # debugger
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :gender, :address, :mobile, :role_id)}
          
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :gender, :address, :mobile, :role_id)}
     end
     include Pundit::Authorization
     rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
     
     private
     def user_not_authorized
          flash[:alert] = 'You are not authorized to perform this action.'
          redirect_to root_path
     end
end
