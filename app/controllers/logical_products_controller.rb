class LogicalProductsController < ApplicationController

  load_and_authorize_resource

  # GET /logical_products
  # GET /logical_products.json
  def index
    @logical_products = LogicalProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logical_products }
    end
  end

  # GET /logical_products/1
  # GET /logical_products/1.json
  def show
    @logical_product = LogicalProduct.find(params[:id])
    @variable_groups = @logical_product.variable_groups

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @logical_product }
    end
  end

  # GET /logical_products/new
  # GET /logical_products/new.json
  def new
    @logical_product = LogicalProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @logical_product }
    end
  end

  # GET /logical_products/1/edit
  def edit
    @logical_product = LogicalProduct.find(params[:id])
  end

  # POST /logical_products
  # POST /logical_products.json
  def create
    @logical_product = LogicalProduct.new(params[:logical_product])

    respond_to do |format|
      if @logical_product.save
        format.html { redirect_to @logical_product, notice: 'Logical product was successfully created.' }
        format.json { render json: @logical_product, status: :created, location: @logical_product }
      else
        format.html { render action: "new" }
        format.json { render json: @logical_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /logical_products/1
  # PUT /logical_products/1.json
  def update
    @logical_product = LogicalProduct.find(params[:id])

    respond_to do |format|
      if @logical_product.update_attributes(params[:logical_product])
        format.html { redirect_to @logical_product, notice: 'Logical product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @logical_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logical_products/1
  # DELETE /logical_products/1.json
  def destroy
    @logical_product = LogicalProduct.find(params[:id])
    @logical_product.destroy

    respond_to do |format|
      format.html { redirect_to logical_products_url }
      format.json { head :no_content }
    end
  end
end
