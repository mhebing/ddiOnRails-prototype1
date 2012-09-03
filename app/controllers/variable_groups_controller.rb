class VariableGroupsController < ApplicationController

  load_and_authorize_resource

  # GET /variable_groups
  # GET /variable_groups.json
  def index
    @variable_groups = VariableGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @variable_groups }
    end
  end

  # GET /variable_groups/1
  # GET /variable_groups/1.json
  def show
    @variable_group = VariableGroup.find(params[:id])
    @variables = @variable_group.variables

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variable_group }
    end
  end

  # GET /variable_groups/new
  # GET /variable_groups/new.json
  def new
    @variable_group = VariableGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variable_group }
    end
  end

  # GET /variable_groups/1/edit
  def edit
    @variable_group = VariableGroup.find(params[:id])
  end

  # POST /variable_groups
  # POST /variable_groups.json
  def create
    @variable_group = VariableGroup.new(params[:variable_group])

    respond_to do |format|
      if @variable_group.save
        format.html { redirect_to @variable_group, notice: 'Variable group was successfully created.' }
        format.json { render json: @variable_group, status: :created, location: @variable_group }
      else
        format.html { render action: "new" }
        format.json { render json: @variable_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /variable_groups/1
  # PUT /variable_groups/1.json
  def update
    @variable_group = VariableGroup.find(params[:id])

    respond_to do |format|
      if @variable_group.update_attributes(params[:variable_group])
        format.html { redirect_to @variable_group, notice: 'Variable group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @variable_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variable_groups/1
  # DELETE /variable_groups/1.json
  def destroy
    @variable_group = VariableGroup.find(params[:id])
    @variable_group.destroy

    respond_to do |format|
      format.html { redirect_to variable_groups_url }
      format.json { head :no_content }
    end
  end
end
