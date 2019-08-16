class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  # :authenticate_user!はログイン認証されていなければ、ログイン画面へリダれくとするdeviseの機能ß
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
    # ログイン後に遷移するpathを設定
  end

def after_sign_up_path_for(resource)
    user_path(current_user.id)
    # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
 end

end
