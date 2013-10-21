class SupplyOrder < ActiveRecord::Base
  belongs_to :supply
  belongs_to :order
end
