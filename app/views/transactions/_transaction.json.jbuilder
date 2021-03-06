# frozen_string_literal: true

json.extract! transaction, :id, :user_id, :month, :year, :value, :status, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
