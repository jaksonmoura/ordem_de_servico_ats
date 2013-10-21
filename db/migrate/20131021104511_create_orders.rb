class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :refers_month

      t.timestamps
    end
  end
end
