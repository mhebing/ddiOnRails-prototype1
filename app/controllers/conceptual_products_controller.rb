class ConceptualProductsController < ApplicationController
  # GET /conceptual_products
  # GET /conceptual_products.json
  def index
    @conceptual_products = ConceptualProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conceptual_products }
    end
  end

  # GET /conceptual_products/1
  # GET /conceptual_products/1.json
  def show
    @conceptual_product = ConceptualProduct.find(params[:id])
    @logical_products = @conceptual_product.logical_products

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conceptual_product }
    end
  end

  # GET /conceptual_products/new
  # GET /conceptual_products/new.json
  def new
    @conceptual_product = ConceptualProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conceptual_product }
    end
  end

  # GET /conceptual_products/1/edit
  def edit
    @conceptual_product = ConceptualProduct.find(params[:id])
  end

  # POST /conceptual_products
  # POST /conceptual_products.json
  def create
    @conceptual_product = ConceptualProduct.new(params[:conceptual_product])

    respond_to do |format|
      if @conceptual_product.save
        format.html { redirect_to @conceptual_product, notice: 'Conceptual product was successfully created.' }
        format.json { render json: @conceptual_product, status: :created, location: @conceptual_product }
      else
        format.html { render action: "new" }
        format.json { render json: @conceptual_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conceptual_products/1
  # PUT /conceptual_products/1.json
  def update
    @conceptual_product = ConceptualProduct.find(params[:id])

    respond_to do |format|
      if @conceptual_product.update_attributes(params[:conceptual_product])
        format.html { redirect_to @conceptual_product, notice: 'Conceptual product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conceptual_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conceptual_products/1
  # DELETE /conceptual_products/1.json
  def destroy
    @conceptual_product = ConceptualProduct.find(params[:id])
    @conceptual_product.destroy

    respond_to do |format|
      format.html { redirect_to conceptual_products_url }
      format.json { head :no_content }
    end
  end
end
