# frozen_string_literal: true

class UniversitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_university, only: %i[show edit update destroy]

  breadcrumb 'Universidades', :universities_path
  breadcrumb -> { set_university.abbreviation },
             -> { university_path(set_university) },
             only: %i[show edit]
  breadcrumb 'Criar', :new_university_path, only: [:new]
  breadcrumb 'Editar', :edit_university_path, only: [:edit]

  # GET /universities
  # GET /universities.json
  def index
    @pagy, @universities = pagy University.all
  end

  # GET /universities/:id
  # GET /universities/:id.json
  def show; end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/:id/edit
  def edit; end

  # POST /universities
  # POST /universities.json
  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/:id
  # PATCH/PUT /universities/:id.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/:id
  # DELETE /universities/:id.json
  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_university
    @university = University.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def university_params
    params.require(:university).permit(:name, :abbreviation, :cnpj,
                                       :city_id, :neighborhood, :address)
  end
end
