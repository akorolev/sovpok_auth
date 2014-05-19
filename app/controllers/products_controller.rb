class ProductsController < ApplicationController
  before_action :set_product, only: [:create, :show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    # TODO Add status and user ID and lot Id !!!
    @product.save!(validate:false)
    redirect_to action: 'edit', id: @product.id
  end

  # GET /products/1/edit
  def edit
  end
  # TODO DELETE POST CREATE !!!
  # POST /products
  # POST /products.json
  def create
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit( :title, :description, :price, :pickup_allowed, :pickup_description, :postage_val1, :postage_val1, :postage_info1, :postage_val2, :postage_val2, :postage_info2, :postage_val3, :postage_val3, :postage_info3, :user_id, :category_id, :lot_id)
    end
end
