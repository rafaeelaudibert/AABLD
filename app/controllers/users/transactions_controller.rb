# frozen_string_literal: true

class Users::TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_transaction, only: %i[show destroy]

  breadcrumb 'Usuário', -> { set_user }
  breadcrumb 'Transações', -> { user_transactions_path(@user) }
  breadcrumb 'Criar', :new_user_transaction_path, only: :new
  breadcrumb 'Editar', :edit_user_transaction_path, only: :edit
  breadcrumb -> { @transaction.breadcrumb },
             -> { user_transaction_path(@transaction.user, @transaction) },
             only: :show

  # GET /users/:user_id/transactions
  # GET /users/:user_id/transactions.json
  def index
    @pagy, @transactions = pagy Transaction.from_user @user
  end

  # GET /users/:user_id/transactions/:id
  # GET /users/:user_id/transactions/:id.json
  def show; end

  # GET /users/:user_id/transactions/new
  def new
    @transaction = Transaction.new
  end

  # POST /users/:user_id/transactions
  # POST /users/:user_id/transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transação criada com sucesso.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:user_id/transactions/:id
  # DELETE /users/:user_id/transactions/:id.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:user_id, :month, :year)
  end
end
