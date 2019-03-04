# frozen_string_literal: true

module TicketsHelper
  def format_currency(value)
    number_to_currency value, unit: 'R$', separator: ',', delimiter: '.', format: '%u %n'
  end
end
