class ConceptGroupsController < ApplicationController
  # GET /concept_groups
  # GET /concept_groups.json
  def index
    @concept_groups = ConceptGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @concept_groups }
    end
  end

  # GET /concept_groups/1
  # GET /concept_groups/1.json
  def show
    @concept_group = ConceptGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concept_group }
    end
  end

  # GET /concept_groups/new
  # GET /concept_groups/new.json
  def new
    @concept_group = ConceptGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concept_group }
    end
  end

  # GET /concept_groups/1/edit
  def edit
    @concept_group = ConceptGroup.find(params[:id])
  end

  # POST /concept_groups
  # POST /concept_groups.json
  def create
    @concept_group = ConceptGroup.new(params[:concept_group])

    respond_to do |format|
      if @concept_group.save
        format.html { redirect_to @concept_group, notice: 'Concept group was successfully created.' }
        format.json { render json: @concept_group, status: :created, location: @concept_group }
      else
        format.html { render action: "new" }
        format.json { render json: @concept_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /concept_groups/1
  # PUT /concept_groups/1.json
  def update
    @concept_group = ConceptGroup.find(params[:id])

    respond_to do |format|
      if @concept_group.update_attributes(params[:concept_group])
        format.html { redirect_to @concept_group, notice: 'Concept group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concept_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concept_groups/1
  # DELETE /concept_groups/1.json
  def destroy
    @concept_group = ConceptGroup.find(params[:id])
    @concept_group.destroy

    respond_to do |format|
      format.html { redirect_to concept_groups_url }
      format.json { head :no_content }
    end
  end
end
