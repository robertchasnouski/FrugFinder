class RemoveAvailableFromDrugs < ActiveRecord::Migration
  def change
    remove_column :drugs, :available, :boolean
  end
end
