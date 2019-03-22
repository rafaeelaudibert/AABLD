# frozen_string_literal: true

class City < ApplicationRecord
  has_many :tickets_as_source, foreign_key: 'source_city', class_name: 'Ticket'
  has_many :tickets_as_destination, foreign_key: 'destination_city', class_name: 'Ticket'
  has_many :universities

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

  # Quantity of students which belongs to the 
  def students_count
    User.where(university: universities).count
  end

  # Return all cities which have a user studying in it
  def self.with_users
    User.all_cities
  end
end
