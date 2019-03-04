# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :source_city, class_name: 'City'
  belongs_to :destination_city, class_name: 'City'
  belongs_to :bus_company
end
