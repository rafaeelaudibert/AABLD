# frozen_string_literal: true

json.array! @user_tickets, partial: 'user_tickets/user_ticket', as: :user_ticket
