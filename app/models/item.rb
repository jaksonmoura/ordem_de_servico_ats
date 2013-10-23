class Item < ActiveRecord::Base
  belongs_to :service
  belongs_to :supply
  belongs_to :order
end
