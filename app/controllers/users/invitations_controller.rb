# frozen_string_literal: true

class Users::InvitationsController < Devise::InvitationsController
  layout 'basic'

  def after_accept_path_for(_resource)
    dashboard_path
  end

  def after_invite_path_for(_resource)
    dashboard_path
  end
end
