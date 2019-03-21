# frozen_string_literal: true

class Users::InvitationsController < Devise::InvitationsController
  layout 'basic'

  def after_invite_path_for(_)
    dashboard_path
  end
end
