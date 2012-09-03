class StudyUnitsController < ApplicationController

  load_and_authorize_resource

  # GET /study_units
  # GET /study_units.json
  def index
    @study_units = StudyUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @study_units }
    end
  end

  # GET /study_units/1
  # GET /study_units/1.json
  def show
    @study_unit = StudyUnit.find(params[:id])
    @logical_products = @study_unit.logical_products
    @data_collections = @study_unit.data_collections

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study_unit }
    end
  end

  # GET /study_units/new
  # GET /study_units/new.json
  def new
    @study_unit = StudyUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study_unit }
    end
  end

  # GET /study_units/1/edit
  def edit
    @study_unit = StudyUnit.find(params[:id])
  end

  # POST /study_units
  # POST /study_units.json
  def create
    @study_unit = StudyUnit.new(params[:study_unit])

    respond_to do |format|
      if @study_unit.save
        format.html { redirect_to @study_unit, notice: 'Study unit was successfully created.' }
        format.json { render json: @study_unit, status: :created, location: @study_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @study_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /study_units/1
  # PUT /study_units/1.json
  def update
    @study_unit = StudyUnit.find(params[:id])

    respond_to do |format|
      if @study_unit.update_attributes(params[:study_unit])
        format.html { redirect_to @study_unit, notice: 'Study unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @study_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_units/1
  # DELETE /study_units/1.json
  def destroy
    @study_unit = StudyUnit.find(params[:id])
    @study_unit.destroy

    respond_to do |format|
      format.html { redirect_to study_units_url }
      format.json { head :no_content }
    end
  end
end
