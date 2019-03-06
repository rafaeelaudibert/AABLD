# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show destroy]

  breadcrumb 'Transações', :transactions_path
  breadcrumb -> { set_transaction.breadcrumb },
             -> { transaction_path(set_transaction) },
             only: [:show]
  breadcrumb 'Criar', :new_transaction_path, only: [:new]
  breadcrumb 'Editar', :edit_transaction_path, only: [:edit]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/:id
  # GET /transactions/:id.json
  def show; end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # POST /transactions
  # POST /transactions.json
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

  # DELETE /transactions/:id
  # DELETE /transactions/:id.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:user_id, :month, :year)
  end
end
