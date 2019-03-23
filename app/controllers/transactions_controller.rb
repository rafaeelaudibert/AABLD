# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!

  breadcrumb 'Transações', :transactions_path
  breadcrumb -> { Transaction.find(params[:id]).breadcrumb },
             -> { user_transaction_path(Transaction.find(params[:id])) },
             only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @pagy, @transactions = pagy Transaction.all
  end

  # GET transactions/:id
  # GET transactions/:id.json
  def show; end
end
