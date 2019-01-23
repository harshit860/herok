class AddRideIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :ride_id, :integer
  end
end
