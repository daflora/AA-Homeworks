class AddResidentstoHouse < ActiveRecord::Migration[5.1]
  def change
    add_column :houses_tables, :residents, :string
  end
end
