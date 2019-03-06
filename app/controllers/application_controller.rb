# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  breadcrumb 'Dashboard', :dashboard_path

  protected

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
