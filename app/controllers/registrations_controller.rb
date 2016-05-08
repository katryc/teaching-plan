class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :field_of_teaching, :city, :email, :password, :password_confirmation, :remember_me)
  end

  def account_update_params
    params.require(:user).permit(:username, :field_of_teaching, :city, :email, :password, :password_confirmation, :current_password)
  end
end
