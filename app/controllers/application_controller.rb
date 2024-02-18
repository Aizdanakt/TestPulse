class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  add_flash_types :success, :error

  def after_sign_in_path_for(resource)
    admin_students_path
  end

  protected

  def set_locale
    I18n.locale = :ru
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name teacher_id group])
  end
end
