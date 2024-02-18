class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  skip_before_action :require_no_authentication
  before_action :authorize_admin, only: %i[new create]

  private

  def authorize_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'Admins only!'
  end

  def sign_up(resource_name, resource)
    true
  end
end
