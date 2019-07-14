# frozen_string_literal: true

class UsersController < ApplicationController
  # CanCan authorization
  load_and_authorize_resource

  # Breadcrumb configuration
  breadcrumb -> { @user.full_name },
             -> { @user },
             only: :show

  def index
    @pagy, @users = pagy User.where.not(role: :admin)
  end

  def show; end

  private

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end
end
