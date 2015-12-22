class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string  :drug_name
      t.decimal :price, precision:8, scale:2
      t.boolean :available

      t.timestamps
    end
  end
end
