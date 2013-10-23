class ItensController < ApplicationController
  before_action :set_order, only: [:destroy]

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html
        format.json
      else
        format.html
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:order_id, :service_id, :supply_id)
    end
end
