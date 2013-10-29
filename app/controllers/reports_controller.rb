class ReportsController < ApplicationController
  def index
    @month = month
    @services = Service.where('year = ?', Date.today.strftime("%Y")).includes(:category)
    @supplies = Supply.where('year = ?', Date.today.strftime("%Y")).includes(:category)
  end

  def new
    @month = params[:month]
    @months = month
    @service_id = params[:service_id]
    @supply_id = params[:supply_id]
    if !@service_id.empty?
      @service = Service.find(@service_id)
      @item = @service.items.where('month(created_at) = ? and year = ?', @month, Date.today.strftime("%Y")).first
      if @item
        @left = @service.qty - @item.qty 
      else
        redirect_to reports_path, notice: 'Não foi encontrado nenhum dado para este mês'
      end
    elsif !@supply_id.empty? 
      @supply = Supply.find(@supply_id)
      @item = @supply.items.where('month(created_at) = ? and year = ?', @month, Date.today.strftime("%Y")).first
      if @item
        @left = @supply.qty - @item.qty
      else
        redirect_to reports_path, notice: 'Não foi encontrado nenhum dado para este mês'
      end
    else
      redirect_to reports_path, notice: 'Você deve escolher o mês e um serviço/suprimento'
    end
    @month_ext = @months[@month]
  end

  def balance
    @services = Service.all
    @supplies = Supply.all
  end

  private
  def month
    { 1 => "Janeiro", 2 => "Fevereiro", 3 => "Março", 4 => "Abril", 5 => "Maio", 6 => "Junho", 7 => "Julho", 8 => "Agosto", 9 => "Setembro", 10 => "Outubro", 11 => "Novembro", 12 => "Dezembro" }
  end

end
