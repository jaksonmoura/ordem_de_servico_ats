class ItemsController < ApplicationController
  before_action :set_order, only: [:destroy]

  def create
    @item = Item.new(item_params)
    unless @item.service_id.nil?
      @sorder = @item.service
      @kind = "srv"
    else
      @sorder = @item.supply
      @kind = "sup"
    end

    respond_to do |format|
      if allow_save && @item.save
        format.html
        format.json
        format.js
      else
        format.js { render 'error', notice: "Não deu!" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:order_id, :service_id, :supply_id, :qty)
    end

    def allow_save
      if @kind == "srv"
        service = @item.service
        used = service.items.map { |i| i.qty }.sum
        service.qty >= used
      else
        supply = @item.supply
        used = supply.items.map { |i| i.qty }.sum
        supply.qty >= used
      end
    end
end
