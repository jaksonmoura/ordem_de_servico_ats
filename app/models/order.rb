class Order < ActiveRecord::Base
  has_many :service_orders
  has_many :services, through: :service_orders
  has_many :supply_orders
  has_many :suppliess, through: :supply_orders
end
