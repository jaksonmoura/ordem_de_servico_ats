class Supply < ActiveRecord::Base
  belongs_to :category
  has_many :supply_orders
  has_many :orders, through: :supply_orders
end
