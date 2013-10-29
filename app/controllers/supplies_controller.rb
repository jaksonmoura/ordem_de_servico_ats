class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    year = params[:year]
    unless year
      @supplies = Supply.where('year = ?', Date.today.strftime("%Y")).includes(:category)
    else
      @supplies = Supply.where('year = ?', year).includes(:category)
    end
    @years = Supply.all.select(:year).group(:year)
  end

  # GET /supplies/new
  def new
    @supply = Supply.new
    # Shows current and next year
    @supplies = [Date.today.year, Date.today.year + 1]
    @categories = Category.all
  end

  # GET /supplies/1/edit
  def edit
    @categories = Category.all
    @supplies = [Date.today.year, Date.today.year + 1]
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @supply = Supply.new(supply_params)
    @categories = Category.all

    respond_to do |format|
      if @supply.save
        format.html { redirect_to supplies_path, notice: 'Supply was successfully created.' }
        format.json { render action: 'index', status: :created, location: @supply }
      else
        format.html { render action: 'new' }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to supplies_path, notice: 'Supply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to supplies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.require(:supply).permit(:description, :unit, :qty, :value, :category_id, :year)
    end
end
