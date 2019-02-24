# frozen_string_literal: true

class BusCompany < ApplicationRecord
  validates :name, presence: true
  validates_cnpj_format_of :cnpj, options: { allow_blank: true, allow_nil: true }
end
