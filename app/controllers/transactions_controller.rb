# frozen_string_literal: true

class TransactionsController < ApplicationController
  # CanCan authorization and loading
  load_and_authorize_resource

  # Breadcrumbs configuration
  breadcrumb 'Transações', :transactions_path
  breadcrumb -> { @transaction.user.full_name },
             -> { user_transactions_path(@transaction.user, @transaction) },
             only: :show
  breadcrumb -> { @transaction.breadcrumb },
             -> { transaction_path(@transaction) },
             only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @pagy, @transactions = pagy Transaction.accessible_by(current_ability)
  end

  # GET transactions/:id
  # GET transactions/:id.json
  def show
    @user = @transaction.user

    if @transaction.open?
      render :edit
    else
      render :show, layout: 'no_card'
    end
  end

  # DELETE transactions/:id
  # DELETE transactions/:id.json
  def destroy
    @transaction.destroy!
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  # GET transactions/:id/open
  def open
    @transaction.open!
    redirect_back fallback_location: root_path, notice: 'Transação aberta com sucesso.'
  end

  # GET transactions/:id/finish
  def finish
    if @transaction.open?
      @transaction.finish!
      redirect_back fallback_location: root_path, notice: 'Transação finalizada com sucesso.'
    else
      redirect_back fallback_location: root_path,
                    alert: 'Transação não foi finalizada, pois não estava aberta.'
    end
  end

  # GET transactions/:id/close
  def close
    if @transaction.finish?
      @transaction.close!
      redirect_back fallback_location: root_path, notice: 'Transação concluída com sucesso.'
    else
      redirect_back fallback_location: root_path,
                    alert: 'Transação não foi concluída, pois não estava finalizada.'
    end
  end

  private

  # Configure the ability for CanCan
  def current_ability
    @current_ability ||= TransactionAbility.new(current_user)
                                           .merge(SidebarAbility.new(current_user))
  end
end
