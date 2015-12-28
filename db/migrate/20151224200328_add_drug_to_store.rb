class AddDrugToStore < ActiveRecord::Migration
  def change
    add_reference :drugs, :store, index: true
  end
end
