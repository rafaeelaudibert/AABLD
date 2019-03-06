# frozen_string_literal: true

class CitiesController < ApplicationController
  before_action :authenticate_user!

  breadcrumb 'Cidades', :cities_path
  breadcrumb -> { set_city.name }, -> { city_path(set_city) }, only: %i[show edit]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @city = City.find(params[:id])
  end
end
