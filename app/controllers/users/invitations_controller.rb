# frozen_string_literal: true

class Users::InvitationsController < Devise::InvitationsController
  layout 'basic'

  # Overrides to check CanCan authorization
  def new
    authorize! :new, User
    super
  end

  def create
    authorize! :create, User
    super
  end

  def update
    super
  end

  def edit
    super
  end

  def after_accept_path_for(_resource)
    dashboard_path
  end

  def after_invite_path_for(_resource)
    new_user_invitation_path
  end

  private

  # Configure CanCan Ability
  def current_ability
    @current_abiliy = UserAbility.new(current_user)
  end
end
