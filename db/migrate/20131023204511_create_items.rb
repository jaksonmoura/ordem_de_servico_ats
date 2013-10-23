class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :service, index: true
      t.references :supply, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
