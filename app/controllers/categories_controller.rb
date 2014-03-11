class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
     @categories = Category.where(parent_id: nil)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
     @path_elements = params[:category].split('/') # gives an array of folder names
     @parent_category = Category.friendly.find(@path_elements.last)
     @categories = Category.where(parent_id: @parent_category.id)
     get_category_id(@parent_category.id)
  end

  # GET /categories/new
  def new
    session[:return_to] ||= request.referer
    @category = Category.new(category_params)
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.id = get_category_id(category_params[:parent_id])

    respond_to do |format|
      if @category.save
        format.html { redirect_to session.delete(:return_to), notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: session.delete(:return_to) }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    puts YAML::dump(params.inspect)
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    rec = Category.find_by(parent_id: @category.id)
    respond_to do |format|
      if rec.nil?
        @category.destroy
        format.html { redirect_to categories_url }
        format.json { head :no_content }
      else
        format.html { redirect_to @category, :alert => "Error! Category #{@category.name} has childs and can't be deleted " }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def get_category_id(p_id)
      p_id = nil if p_id.to_i == 0
      category_lvl_mask = [0xfc000000, 0x3f00000, 0xfc000, 0x3f00, 0xfc, 0x3]
      lvl = -1
      category_lvl_mask.each_with_index do |item, i|
        lvl = i if (item & p_id.to_i) != 0
      end
      mask = category_lvl_mask[lvl + 1]
      add = 1
      while ((add & mask)==0) do add = add << 1 end
      last_rec = Category.where(parent_id: p_id).order(:id).last
      last_rec.nil? ? add : last_rec.id + add
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:id, :name, :slug, :parent_id) if params.has_key?(:category)
    end
end
