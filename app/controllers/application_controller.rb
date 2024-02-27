class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :render404
  rescue_from ActionController::RoutingError, with: :handle_routing_error
  rescue_from NoMethodError, with: :render500

  add_flash_types :success, :error

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_students_path
    else
      user_tasks_path
    end
  end


  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def render500
    render file: "#{Rails.root}/public/500.html", status: :not_found
  end

  def render404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def handle_routing_error
    redirect_to root_url, alert: t('.error_page')
  end

  def set_locale
    I18n.locale = :en
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name teacher_id group])
  end
end
