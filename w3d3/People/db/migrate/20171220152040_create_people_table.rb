class CreatePeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people_tables do |t|
      t.text :name, null: false
      t.integer :house_id, null: false
    end
  end
end
