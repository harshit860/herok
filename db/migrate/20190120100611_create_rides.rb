class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :location
      t.string :bike
      t.text :description

      t.timestamps
    end
  end
end
