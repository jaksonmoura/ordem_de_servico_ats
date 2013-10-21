class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :description
      t.string :unit
      t.integer :qty
      t.decimal :value, precision: 20, scale: 2
      t.references :category, index: true

      t.timestamps
    end
  end
end
