class ProductImagesController < ApplicationController
  before_action :set_product_image, only: [:show, :edit, :update, :destroy]

  # GET /product_images
  # GET /product_images.json
  def index
    @product_images = ProductImage.where(product_id: params[:product_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_images.map{|image| image.to_jq_upload } }
    end
  end

  # GET /product_images/1
  # GET /product_images/1.json
  def show
  end

  # GET /product_images/new
  def new
    @product_image = ProductImage.new
  end

  # GET /product_images/1/edit
  def edit
  end

  # POST /product_images
  # POST /product_images.json
  def create
    @product_image = ProductImage.new()
    @product_image.photo = product_image_params[:photo][0]
    @product_image.product_id = params[:product_id]
    save_and_render
  end

  def create_from_uri
    @product_image = ProductImage.new
    @product_image.picture_from_url(params[:url])
    save_and_render
  end

  # PATCH/PUT /product_images/1
  # PATCH/PUT /product_images/1.json
  def update
    respond_to do |format|
      if @product_image.update(product_image_params)
        format.html { redirect_to @product_image, notice: 'Product image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_images/1
  # DELETE /product_images/1.json
  def destroy
    @product_image.destroy
    respond_to do |format|
      format.html { redirect_to product_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def save_and_render
      respond_to do |format|
        if @product_image.save
          format.html {
            render :json => [@product_image.to_jq_upload].to_json,
                   :content_type => 'text/html',
                   :layout => false
          }
          format.json { render json: {files: [@product_image.to_jq_upload]}, status: :created, location: @product_image }
        else
          puts @product_image.errors.inspect

          format.html { render action: "new" }
          format.json { render json: @product_image.errors, status: :unprocessable_entity }
        end
      end
    end

    def set_product_image
      @product_image = ProductImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_image_params
      params.require(:product_image).permit(:photo => [])
    end
end
