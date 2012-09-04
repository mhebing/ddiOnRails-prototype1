class PhysicalInstancesController < ApplicationController

  load_and_authorize_resource

  # GET /physical_instances
  # GET /physical_instances.json
  def index
    @physical_instances = PhysicalInstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @physical_instances }
    end
  end

  # GET /physical_instances/1
  # GET /physical_instances/1.json
  def show
    @physical_instance = PhysicalInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @physical_instance }
    end
  end

  # GET /physical_instances/new
  # GET /physical_instances/new.json
  def new
    @physical_instance = PhysicalInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @physical_instance }
    end
  end

  # GET /physical_instances/1/edit
  def edit
    @physical_instance = PhysicalInstance.find(params[:id])
  end

  # POST /physical_instances
  # POST /physical_instances.json
  def create
    @physical_instance = PhysicalInstance.new(params[:physical_instance])

    respond_to do |format|
      if @physical_instance.save
        format.html { redirect_to @physical_instance, notice: 'Physical instance was successfully created.' }
        format.json { render json: @physical_instance, status: :created, location: @physical_instance }
      else
        format.html { render action: "new" }
        format.json { render json: @physical_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /physical_instances/1
  # PUT /physical_instances/1.json
  def update
    @physical_instance = PhysicalInstance.find(params[:id])

    respond_to do |format|
      if @physical_instance.update_attributes(params[:physical_instance])
        format.html { redirect_to @physical_instance, notice: 'Physical instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @physical_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_instances/1
  # DELETE /physical_instances/1.json
  def destroy
    @physical_instance = PhysicalInstance.find(params[:id])
    @physical_instance.destroy

    respond_to do |format|
      format.html { redirect_to physical_instances_url }
      format.json { head :no_content }
    end
  end
end
