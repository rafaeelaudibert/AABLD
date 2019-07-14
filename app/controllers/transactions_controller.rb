# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show destroy]
  before_action :set_user, only: :show

  breadcrumb 'Transações', :transactions_path
  breadcrumb -> { @user.full_name },
             -> { user_transactions_path(@user, @transaction) },
             only: :show
  breadcrumb -> { @transaction.breadcrumb },
             -> { transaction_path(@transaction) },
             only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @pagy, @transactions = pagy Transaction.all
  end

  # GET transactions/:id
  # GET transactions/:id.json
  def show
    @user = @transaction.user

    if @transaction.open?
      render :edit
    else
      render :show
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
    if @transaction.finish?
      @transaction.open!
      redirect_back fallback_location: root_path, notice: 'Transação aberta com sucesso.'
    else
      redirect_back fallback_location: root_path,
                    alert: 'Transação não foi aberta, pois não estava finalizada'
    end
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
      @transaction.closed!
      redirect_back fallback_location: root_path, notice: 'Transação concluída com sucesso.'
    else
      redirect_back fallback_location: root_path,
                    alert: 'Transação não foi concluída, pois não estava finalizada.'
    end
  end

  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_user
    @user = @transaction.user
  end
end
