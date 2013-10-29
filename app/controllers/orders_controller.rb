class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :print]
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.includes(:services, :supplies)
    @order = Order.new
    @month = month
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @month = month
  end

  # GET /orders/new
  def new
    @order = Order.new
    @month = month
  end

  # GET /orders/1/edit
  def edit
    @month = month
    @orders = @order.services + @order.supplies
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @orders = Order.all

    respond_to do |format|
      if @order.save
        format.html { redirect_to edit_order_path(@order), notice: 'Order was successfully created.' }
        format.json { render action: 'edit', status: :created, location: @order }
      else
        format.html { render action: 'index' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  # Localiza um serviço ou uma peça/componente/ferramenta
  # E retorna os resultados juntos em json
  def find_item
    @services = Service.where("description LIKE ? and year = ?", "%#{params[:item]}%", Date.today.strftime("%Y"))
    @supplies = Supply.where("description LIKE ? and year = ?", "%#{params[:item]}%", Date.today.strftime("%Y"))

    @result_sv = @services.map do |sv|
      { value: "SRV: " + sv.description, id: sv.id, kind: "srv" }
    end

    @result_sp = @supplies.map do |sp|
      { value: "SUP: " + sp.description, id: sp.id, kind: "sup" }
    end

    @result = @result_sv + @result_sp
    respond_to do |format|
      format.json { render :json => @result.to_json }
      # format.html { render :json => @result.to_json }
    end
  end

  # GET /orders/1/print
  def print
    @month = month
    @orders = @order.services + @order.supplies
    render layout: 'print'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:refers_month)
    end

    def month
      { 1 => "Janeiro", 2 => "Fevereiro", 3 => "Março", 4 => "Abril", 5 => "Maio", 6 => "Junho", 7 => "Julho", 8 => "Agosto", 9 => "Setembro", 10 => "Outubro", 11 => "Novembro", 12 => "Dezembro" }
    end
end
