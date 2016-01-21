class CreateSearchLines < ActiveRecord::Migration
  def change
    create_table :search_lines do |t|
      t.string :name
      t.string :user_name

      t.timestamps
    end
  end
end
