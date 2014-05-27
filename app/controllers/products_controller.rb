class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy]

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

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      puts "=-=-=-=-=-=-=-=-=-=-=-=-="
      update_top(@product, params[:product][:top_image].to_i)
      @product.category_id = 0
      puts params.inspect
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_top(product, top_image_id)
    product.product_images.each do |image|
      image.update top: false if image.top
      image.update top: true if top_image_id == image.id
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
      params_list = [:title, :description, :price, :pickup_allowed, :pickup_description, :user_id, :category_id, :lot_id]
      for i in 1..3
        params_list.push("postage_val#{i}", "postage_info#{i}")
      end
      for i in 0..CategoriesController::LVL_MASK.length
        params_list.push("sub_category_lvl#{i}")
      end

      params.require(:product).permit(params_list)
    end
end
