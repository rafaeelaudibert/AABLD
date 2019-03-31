# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_many :user_tickets, dependent: :restrict_with_error
  belongs_to :source_city, class_name: 'City'
  belongs_to :destination_city, class_name: 'City'
  belongs_to :bus_company

  validate :not_duplicated

  def itinerary
    "#{source_city.name} -> #{destination_city.name}"
  end

  private

  def not_duplicated
    same_tickets = Ticket.where(source_city: source_city,
                                destination_city: destination_city,
                                bus_company: bus_company)

    # rubocop:disable Style/GuardClause
    unless same_tickets.count.zero? || same_tickets.first == self
      errors.add(:bus_company_id,
                 "Essa empresa já possui uma passagem com rota #{itinerary}")
    end
    # rubocop:enable Style/GuardClause
  end
end
