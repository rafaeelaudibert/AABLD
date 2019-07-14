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

  def full_itinerary
    "#{source_city.name} -> #{destination_city.name} | #{bus_company.name}"
  end

  def self.view_select
    all.joins(:source_city)
       .joins(:destination_city)
       .map { |ticket| [ticket.itinerary, ticket.id, { price: ticket.value }] }
  end

  def self.full_view_select
    all.joins(:source_city)
       .joins(:destination_city)
       .map { |ticket| [ticket.full_itinerary, ticket.id, { price: ticket.value }] }
  end

  def self.full_view_select_for_bip
    full_view_select.map do |ticket|
      ticket.take! 2
      ticket.reverse!
      ticket
    end.to_h
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
