class DataCollectionsController < ApplicationController

  load_and_authorize_resource

  # GET /data_collections
  # GET /data_collections.json
  def index
    @data_collections = DataCollection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_collections }
    end
  end

  # GET /data_collections/1
  # GET /data_collections/1.json
  def show
    @data_collection = DataCollection.find(params[:id])
    @questionnaires = @data_collection.questionnaires

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_collection }
    end
  end

  # GET /data_collections/new
  # GET /data_collections/new.json
  def new
    @data_collection = DataCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_collection }
    end
  end

  # GET /data_collections/1/edit
  def edit
    @data_collection = DataCollection.find(params[:id])
  end

  # POST /data_collections
  # POST /data_collections.json
  def create
    @data_collection = DataCollection.new(params[:data_collection])

    respond_to do |format|
      if @data_collection.save
        format.html { redirect_to @data_collection, notice: 'Data collection was successfully created.' }
        format.json { render json: @data_collection, status: :created, location: @data_collection }
      else
        format.html { render action: "new" }
        format.json { render json: @data_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_collections/1
  # PUT /data_collections/1.json
  def update
    @data_collection = DataCollection.find(params[:id])

    respond_to do |format|
      if @data_collection.update_attributes(params[:data_collection])
        format.html { redirect_to @data_collection, notice: 'Data collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_collections/1
  # DELETE /data_collections/1.json
  def destroy
    @data_collection = DataCollection.find(params[:id])
    @data_collection.destroy

    respond_to do |format|
      format.html { redirect_to data_collections_url }
      format.json { head :no_content }
    end
  end
end
