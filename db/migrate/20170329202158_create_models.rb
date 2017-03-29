class CreateModels < ActiveRecord::Migration[5.0]
  def change
   	create_table :models do |t|
  		t.string :name
  		t.integer :brand_id
  		t.integer :type_id
  	end
  end
end
