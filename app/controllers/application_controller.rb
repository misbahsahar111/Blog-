class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
    end

    def after_sign_out_path_for(resource_or_scope)
        user_session_path

      end

      def only_see_own_page
        @user = User.find(params[:id])
      
        if current_user != @user
          redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
        end
      end
  end

