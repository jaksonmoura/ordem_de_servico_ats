class CreateServiceOrders < ActiveRecord::Migration
  def change
    create_table :service_orders do |t|
      t.references :service, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
