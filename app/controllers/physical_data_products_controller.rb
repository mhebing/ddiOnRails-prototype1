class PhysicalDataProductsController < ApplicationController
  # GET /physical_data_products
  # GET /physical_data_products.json
  def index
    @physical_data_products = PhysicalDataProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @physical_data_products }
    end
  end

  # GET /physical_data_products/1
  # GET /physical_data_products/1.json
  def show
    @physical_data_product = PhysicalDataProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @physical_data_product }
    end
  end

  # GET /physical_data_products/new
  # GET /physical_data_products/new.json
  def new
    @physical_data_product = PhysicalDataProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @physical_data_product }
    end
  end

  # GET /physical_data_products/1/edit
  def edit
    @physical_data_product = PhysicalDataProduct.find(params[:id])
  end

  # POST /physical_data_products
  # POST /physical_data_products.json
  def create
    @physical_data_product = PhysicalDataProduct.new(params[:physical_data_product])

    respond_to do |format|
      if @physical_data_product.save
        format.html { redirect_to @physical_data_product, notice: 'Physical data product was successfully created.' }
        format.json { render json: @physical_data_product, status: :created, location: @physical_data_product }
      else
        format.html { render action: "new" }
        format.json { render json: @physical_data_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /physical_data_products/1
  # PUT /physical_data_products/1.json
  def update
    @physical_data_product = PhysicalDataProduct.find(params[:id])

    respond_to do |format|
      if @physical_data_product.update_attributes(params[:physical_data_product])
        format.html { redirect_to @physical_data_product, notice: 'Physical data product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @physical_data_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_data_products/1
  # DELETE /physical_data_products/1.json
  def destroy
    @physical_data_product = PhysicalDataProduct.find(params[:id])
    @physical_data_product.destroy

    respond_to do |format|
      format.html { redirect_to physical_data_products_url }
      format.json { head :no_content }
    end
  end
end
