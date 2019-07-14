# frozen_string_literal: true

# Class responsible for handling the Cities which Universities can belong to
class CitiesController < ApplicationController
  # CanCan authorization and loading
  load_and_authorize_resource

  # Breadcrumbs configuration
  breadcrumb 'Cidades', :cities_path
  breadcrumb -> { @city.name }, -> { city_path(@city) }, only: :show

  # GET /cities
  # GET /cities.json
  def index
    @pagy, @cities = pagy_array City.accessible_by(current_ability).with_users
  end

  # GET /cities/all
  # GET /cities/all.json
  def all
    @pagy, @cities = pagy City.accessible_by(current_ability)
    render :index
  end

  # GET /cities/:id
  # GET /cities/:id.json
  def show; end

  private

  # Configure the ability for CanCan
  def current_ability
    @current_ability ||= CityAbility.new(current_user)
  end
end
