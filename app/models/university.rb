# frozen_string_literal: true

class University < ApplicationRecord
  belongs_to :city
  has_many :users

  validates :name, presence: true
  validates_cnpj_format_of :cnpj, options: { allow_blank: true, allow_nil: true }

  delegate :state, to: :city
  delegate :state_abbreviation, to: :city

  def abbr_and_name
    "#{abbreviation} | #{name}"
  end

  def city_and_state
    "#{city.name}/#{city.state_abbreviation}"
  end
end
