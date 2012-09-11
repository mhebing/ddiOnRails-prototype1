class BasketsController < ApplicationController

  load_and_authorize_resource

  # GET /baskets
  # GET /baskets.json
  def index
    @baskets = Basket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baskets }
    end
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
    @basket = Basket.find(params[:id])
    @variable_groups = @basket.variable_groups

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @basket }
    end
  end

  # GET /baskets/new
  # GET /baskets/new.json
  def new
    @basket = Basket.new(user_id: current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basket }
    end
  end

  # GET /baskets/1/edit
  def edit
    @basket = Basket.find(params[:id])
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(params[:basket])

    respond_to do |format|
      if @basket.save
        session[:basket_id] = @basket.id
        format.html { redirect_to basket_path(@basket.id), notice: 'Basket was successfully created.' }
        format.json { render json: @basket, status: :created, location: @basket }
      else
        format.html { render action: "new" }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /baskets/1
  # PUT /baskets/1.json
  def update
    @basket = Basket.find(params[:id])

    respond_to do |format|
      if @basket.update_attributes(params[:basket])
        format.html { redirect_to @basket, notice: 'Basket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket = Basket.find(params[:id])
    @basket.destroy

    respond_to do |format|
      format.html { redirect_to baskets_url }
      format.json { head :no_content }
    end
  end

  def set
    session[:basket_id] = params["basket_id"]
    if params["basket_id"] == ""
      redirect_to new_basket_path
    else
      redirect_to basket_path(params["basket_id"])
    end
  end

  def add_variable
    @basket = Basket.find(session[:basket_id])
    @variable_group = Variable.find(params["variable_id"]).variable_group
    unless @basket.blank? | @variable_group.blank?
      @basket.variable_groups << @variable_group
    end
    redirect_to request.referer
  end

  def remove_variable
    @basket = Basket.find(session[:basket_id])
    @variable_group = Variable.find(params["variable_id"]).variable_group
    unless @basket.blank? | @variable_group.blank?
      @basket.variable_groups.delete @variable_group
    end
    redirect_to request.referer
  end

end
