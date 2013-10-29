class AddYearToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :year, :integer
  end
end
