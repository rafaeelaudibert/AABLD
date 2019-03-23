# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  breadcrumb -> { "Usuário '#{User.find(params[:id]).full_name}'" },
             -> { User.find(params[:id]) },
             except: :index

  def index
    @pagy, @users = pagy User.where.not(role: :admin)
  end
end
