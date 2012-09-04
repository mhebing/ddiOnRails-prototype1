class VariableCategoriesController < ApplicationController

  load_and_authorize_resource

  # GET /variable_categories
  # GET /variable_categories.json
  def index
    @variable_categories = VariableCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @variable_categories }
    end
  end

  # GET /variable_categories/1
  # GET /variable_categories/1.json
  def show
    @variable_category = VariableCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variable_category }
    end
  end

  # GET /variable_categories/new
  # GET /variable_categories/new.json
  def new
    @variable_category = VariableCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variable_category }
    end
  end

  # GET /variable_categories/1/edit
  def edit
    @variable_category = VariableCategory.find(params[:id])
  end

  # POST /variable_categories
  # POST /variable_categories.json
  def create
    @variable_category = VariableCategory.new(params[:variable_category])

    respond_to do |format|
      if @variable_category.save
        format.html { redirect_to @variable_category, notice: 'Variable category was successfully created.' }
        format.json { render json: @variable_category, status: :created, location: @variable_category }
      else
        format.html { render action: "new" }
        format.json { render json: @variable_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /variable_categories/1
  # PUT /variable_categories/1.json
  def update
    @variable_category = VariableCategory.find(params[:id])

    respond_to do |format|
      if @variable_category.update_attributes(params[:variable_category])
        format.html { redirect_to @variable_category, notice: 'Variable category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @variable_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variable_categories/1
  # DELETE /variable_categories/1.json
  def destroy
    @variable_category = VariableCategory.find(params[:id])
    @variable_category.destroy

    respond_to do |format|
      format.html { redirect_to variable_categories_url }
      format.json { head :no_content }
    end
  end
end
