# frozen_string_literal: true

class ExceptionsApp < Rambulance::ExceptionsApp
  def bad_request; end

  def forbidden; end

  def internal_server_error; end

  def not_found; end

  def unprocessable_entity; end

  protected

  # Configure the default ability for CanCan
  def current_ability
    @current_ability ||= SidebarAbility.new(current_user)
  end
end
