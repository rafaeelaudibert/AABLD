# frozen_string_literal: true

json.extract! bus_company, :id, :name, :cnpj, :city, :neighborhood, :address
json.url bus_company_url(bus_company, format: :json)
