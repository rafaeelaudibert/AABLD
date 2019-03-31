# frozen_string_literal: true

class Users::TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  breadcrumb 'Usuário', -> { set_user }
  breadcrumb 'Transações', -> { user_transactions_path(@user) }

  # GET /users/:user_id/transactions
  # GET /users/:user_id/transactions.json
  def index
    @pagy, @transactions = pagy Transaction.from_user @user
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
        pp @transaction.errors
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.permit(:user_id).merge(month: Transaction.current_month_index,
                                  year: Transaction.current_year)
  end
end
