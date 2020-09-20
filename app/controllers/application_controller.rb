class ApplicationController < ActionController::Base
  # before_action :authenticate_user! #今回不要
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :email, :encrypted_password, :birthday, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at])
  end
end
