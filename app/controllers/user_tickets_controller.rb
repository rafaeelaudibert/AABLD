# frozen_string_literal: true

class UserTicketsController < ApplicationController
  # CanCan authorization and loading
  load_and_authorize_resource

  # POST /user_tickets.json
  def create
    # If transaction is not open, cannot create a user_ticket
    raise StandardError, 'Transação não está aberta' unless @user_ticket.monthly_transaction.open?

    @user_ticket.save!
    respond_to do |format|
      format.json { render :show, user_ticket: @user_ticket }
    end
  end

  # PATCH/PUT /user_tickets/:id.json
  def update
    @user_ticket.update!(user_ticket_params)

    respond_to do |format|
      format.json { render :show, user_ticket: @user_ticket }
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_ticket_params
    params.require(:user_ticket).permit(:user_id, :ticket_id, :quantity,
                                        :original_value, :transaction_id)
  end

  # Configure the ability for CanCan
  def current_ability
    @current_ability ||= UserTicketAbility.new(current_user)
  end
end
