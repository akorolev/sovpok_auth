class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.all
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
  end

  # GET /lots/new
  def new
    @lot = Lot.new
  end

  # GET /lots/1/edit
  def edit
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(lot_params)
    puts lot_params.inspect
    respond_to do |format|
      if @lot.save
        format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lot }
      else
        format.html { render action: 'new' }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      ret = params.require(:lot).permit(:title, :description, :end_date, :prepay, :fee, :min_order, :pickup_allowed, :pickup_description, :postage_val1, :postage_info1, :postage_val2, :postage_info2, :postage_val3, :postage_info3, :source, :serial, :keywords, :status, :category_id, :user_id, :condition,:terms_of_service)
      for i in 1..3
        ret.update(params.require(:lot).permit("postage_val#{i}", "postage_info#{i}"))
      end
      for i in 0..CategoriesController::LVL_MASK.length
        ret.update(params.require(:lot).permit("sub_category_lvl#{i}"))
      end
      ret
    end
end
