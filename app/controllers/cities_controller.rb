# frozen_string_literal: true

class CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city, only: [:show]

  breadcrumb 'Cidades', :cities_path
  breadcrumb -> { set_city.name }, -> { city_path(set_city) }, only: %i[show edit]

  # GET /cities
  # GET /cities.json
  def index
    @pagy, @cities = pagy_array City.with_users
  end

  # GET /cities/all
  # GET /cities/all.json
  def all
    @pagy, @cities = pagy City.all
    render :index
  end

  # GET /cities/:id
  # GET /cities/:id.json
  def show; end

  private

  def set_city
    @city = City.find(params[:id])
  end
end
