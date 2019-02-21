# frozen_string_literal: true

class University < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
  validates_cnpj_format_of :cnpj, options: { allow_blank: true, allow_nil: true }

  delegate :state, to: :city
end
