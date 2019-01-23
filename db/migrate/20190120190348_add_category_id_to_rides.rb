class AddCategoryIdToRides < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :category_id, :integer
  end
end
