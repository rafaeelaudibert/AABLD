# frozen_string_literal: true

class UserTicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_ticket, only: %i[update destroy]

  # POST /user_tickets.json
  def create
    @user_ticket = UserTicket.new(user_ticket_params)
    respond_to do |format|
      if @user_ticket.save
        format.json { render json: @user_tickets, status: :created }
      else
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tickets/:id.json
  def update
    respond_to do |format|
      if @user_ticket.update(user_ticket_params)
        format.json { render json: @user_ticket, status: :ok }
      else
        format.json { render json: @user_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tickets/:id.json
  def destroy
    @user_ticket.destroy!
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_ticket
    @user_ticket = UserTicket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_ticket_params
    params.require(:user_ticket).permit(:user_id, :ticket_id, :quantity, :transaction_id)
  end
end
