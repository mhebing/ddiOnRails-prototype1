class VariableStatisticsController < ApplicationController

  load_and_authorize_resource

  # GET /variable_statistics
  # GET /variable_statistics.json
  def index
    @variable_statistics = VariableStatistic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @variable_statistics }
    end
  end

  # GET /variable_statistics/1
  # GET /variable_statistics/1.json
  def show
    @variable_statistic = VariableStatistic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variable_statistic }
    end
  end

  # GET /variable_statistics/new
  # GET /variable_statistics/new.json
  def new
    @variable_statistic = VariableStatistic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variable_statistic }
    end
  end

  # GET /variable_statistics/1/edit
  def edit
    @variable_statistic = VariableStatistic.find(params[:id])
  end

  # POST /variable_statistics
  # POST /variable_statistics.json
  def create
    @variable_statistic = VariableStatistic.new(params[:variable_statistic])

    respond_to do |format|
      if @variable_statistic.save
        format.html { redirect_to @variable_statistic, notice: 'Variable statistic was successfully created.' }
        format.json { render json: @variable_statistic, status: :created, location: @variable_statistic }
      else
        format.html { render action: "new" }
        format.json { render json: @variable_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /variable_statistics/1
  # PUT /variable_statistics/1.json
  def update
    @variable_statistic = VariableStatistic.find(params[:id])

    respond_to do |format|
      if @variable_statistic.update_attributes(params[:variable_statistic])
        format.html { redirect_to @variable_statistic, notice: 'Variable statistic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @variable_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variable_statistics/1
  # DELETE /variable_statistics/1.json
  def destroy
    @variable_statistic = VariableStatistic.find(params[:id])
    @variable_statistic.destroy

    respond_to do |format|
      format.html { redirect_to variable_statistics_url }
      format.json { head :no_content }
    end
  end
end
