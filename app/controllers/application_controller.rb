class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_users_path
      #pathは設定したい遷移先へのpathを指定してください
      
    when User
      root_path
      #ここもpathはご自由に変更してください
    end
  end
  
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
