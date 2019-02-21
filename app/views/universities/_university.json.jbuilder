# frozen_string_literal: true

json.extract! university, :id, :name, :cnpj, :neighborhood, :address
json.url university_url(university, format: :json)
json.city do |json|
  json.extract! university.city, :id, :name
  json.url city_url(university.city, format: :json)
end
