# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_many :user_tickets
  belongs_to :source_city, class_name: 'City'
  belongs_to :destination_city, class_name: 'City'
  belongs_to :bus_company

  validate :not_duplicated

  def itinerary
    "#{source_city.name} -> #{destination_city.name}"
  end

  private

  def not_duplicated
    unless Ticket.where(source_city: source_city,
                        destination_city: destination_city,
                        bus_company: bus_company).length.zero?
      errors.add(:source_city,
                 "já possui uma passagem com destino a #{destination_city.name} \
                 com a empresa #{bus_company.name}")
    end
  end
end
