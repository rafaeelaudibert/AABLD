# frozen_string_literal: true

json.extract! user_ticket, :id, :user_id, :transaction_id, :quantity, :original_value
json.url user_ticket_url(user_ticket, format: :json)

json.ticket do
  json.partial!('tickets/ticket', ticket: user_ticket.ticket)
end
