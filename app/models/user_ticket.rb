# frozen_string_literal: true

class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  # belongs_to :transaction #Commented while we doesn't use it, to fix a bug

  validates :quantity, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  delegate :source_city, :destination_city, :bus_company, :value, to: :ticket, allow_nil: true
end
