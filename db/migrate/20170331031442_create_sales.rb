class CreateSales < ActiveRecord::Migration[5.0]
  def change
  	create_table :sales do |t|
  		t.string :customer_name
  		t.string :vehicle_model
  		t.string :vehicle_make
  		t.string :vehicle_type
  		t.integer :vehicle_cost
  		t.string :address
  		t.string :phone
  		t.integer :rating
  		t.timestamps
  	end
  end
end
