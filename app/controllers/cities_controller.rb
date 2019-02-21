# frozen_string_literal: true

class CitiesController < ApplicationController
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
