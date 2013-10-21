class CreateSupplyOrders < ActiveRecord::Migration
  def change
    create_table :supply_orders do |t|
      t.references :supply, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
