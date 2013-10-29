class AddYearToServices < ActiveRecord::Migration
  def change
    add_column :services, :year, :integer
  end
end
