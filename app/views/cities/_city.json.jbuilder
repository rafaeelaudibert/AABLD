# frozen_string_literal: true

json.extract! city, :id, :name
json.url city_url(city, format: :json)
