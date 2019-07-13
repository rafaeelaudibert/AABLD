# frozen_string_literal: true

json.extract! ticket, :id, :source_city_id, :destination_city_id, :value,
              :bus_company_id, :created_at, :updated_at, :full_itinerary
json.url ticket_url(ticket, format: :json)
