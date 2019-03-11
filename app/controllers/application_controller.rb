class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: :index
    before_action :configure_permitted_parameters, if: :devise_controller?



  




    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :rut, :address, :commune, :image, :role ])
    end

    def after_sign_in_path_for(resource)
      sign_in_url = new_user_session_url
      if request.referer == sign_in_url
        user_profile_path(resource)
      #else
        #stored_location_for(resource) || request.referer || root_path
      end
    end
end
