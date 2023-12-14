class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top], unless: :admin_url
  before_action :authenticate_admin!, if: :admin_url
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 def admin_url
  request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_users_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  
   protected
   
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:sex])
  end
end
