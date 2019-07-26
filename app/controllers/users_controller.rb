# frozen_string_literal: true

class UsersController < ApplicationController
  # CanCan authorization
  load_and_authorize_resource

  # Breadcrumb configuration
  breadcrumb -> { @user.full_name },
             -> { @user },
             except: :index
  breadcrumb 'Edição', only: :show

  def index
    @pagy, @users = pagy User.where.not(role: :admin)
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :cpf, :rg)
  end

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
                                    .merge(SidebarAbility.new(current_user))
  end
end
