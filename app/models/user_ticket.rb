# frozen_string_literal: true

class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  # belongs_to :transaction # Commented while we doesn't use it, to fix the following bug:
  # ArgumentError (You tried to define an association named transaction on the model UserTicket,
  # but this will conflict with a method transaction already defined by Active Record.
  # Please choose a different association name.):

  validates :quantity, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  delegate :source_city, :destination_city, :bus_company, :value, to: :ticket, allow_nil: true

  def total
    quantity * original_value
  end
end
