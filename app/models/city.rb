# frozen_string_literal: true

class City < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true

  def state
    'Rio Grande do Sul'
  end

  def state_abbreviation
    'RS'
  end
end
