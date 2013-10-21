class Service < ActiveRecord::Base
  belongs_to :category
  has_many :service_orders
  has_many :orders, through: :service_orders
end
