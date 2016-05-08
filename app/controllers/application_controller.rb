class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  def after_sign_in_path_for(resource)
    edit_profile_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    edit_profile_path(current_user.id)
  end


  # protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :field_of_teaching, :city, :email, :password, :remember_me)}
  #   devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:email, :password, :remember_me)}
  #   devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :field_of_teaching, :city, :email, :password, :remember_me)}
  # end
end
