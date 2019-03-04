# frozen_string_literal: true

class City < ApplicationRecord
  has_many :tickets_as_source, foreign_key: 'source_city', class_name: 'Ticket'
  has_many :tickets_as_destination, foreign_key: 'destination_city', class_name: 'Ticket'

  validates :id, presence: true, uniqueness: true
  validates :name, presence: true

  def state
    'Rio Grande do Sul'
  end

  def state_abbreviation
    'RS'
  end

  def tickets
    {
      source: tickets_as_source,
      destination: tickets_as_destination
    }
  end
end
