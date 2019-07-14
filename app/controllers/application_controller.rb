# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  breadcrumb 'Dashboard', :dashboard_path

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Handle CanCan Exception
  # TODO: When updating error pages, update this to redirect to it
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to dashboard_url, notice: exception.message }
    end
  end

  protected

  # Devise method
  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  # Devise method
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite,
                                      keys: %i[email first_name last_name cpf rg birthdate
                                               father_name mother_name address phone mobile_phone
                                               bank_account bank_agency bank_option university_id
                                               course semester place ticket_responsible_id])
  end
end
