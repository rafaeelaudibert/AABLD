# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show

  breadcrumb -> { @user.full_name },
             -> { @user },
             only: :show

  def index
    @pagy, @users = pagy User.where.not(role: :admin)
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
