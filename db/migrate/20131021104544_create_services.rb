class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :description
      t.integer :qty
      t.decimal :value
      t.references :category, index: true

      t.timestamps
    end
  end
end
