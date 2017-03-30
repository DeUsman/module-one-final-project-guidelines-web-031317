require_relative '../config/environment'

require "httparty"
require 'pry'


def fetch_and_seed_vehicle_type
url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetVehicleTypesForMake/merc?format=json"
response = HTTParty.get(url)
	response["Results"].each do |car|
		if(car["VehicleTypeName"] == "Passenger Car" || car["VehicleTypeName"] == "Truck ")
        Type.find_or_create_by(name: car["VehicleTypeName"])
        end
	end
end


def fetch_and_seed_makes
url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetMakesForVehicleType/car?format=json"
response = HTTParty.get(url)
	response["Results"].each do |car|
		if(car["MakeName"] == "Ford" || car["MakeName"] == "Honda" || car["MakeName"] == "Acura" || car["MakeName"] == "Lexus" || car["MakeName"] == "BMW" || car["MakeName"] == "Mercedes-Benz" || car["MakeName"] == "Cadillac" || car["MakeName"] == "Jaguar" || car["MakeName"] == "Toyota" || car["MakeName"] = "Nissan")
        Make.find_or_create_by(name: car["MakeName"])
        end

	end	
end


def fetch_and_seed_models
	new_array = []
	make_ids = [460, 474, 475, 515, 452, 449, 469, 442, 448, 478]
	make_id = 0
	Make.all.each do |make|
		Type.all.each do |type|
			add_underscore_type = type.name.gsub(" ", "_")
			
			if (make.name == "Ford")
				make_id = 460
			elsif (make.name == "Honda")
				make_id = 474
			elsif (make.name == "Acura")
				make_id = 475
			elsif (make.name == "Lexus")
				make_id = 515
			elsif (make.name == "BMW")
				make_id = 452
			elsif (make.name == "Mercedes-Benz")
				make_id = 449
			elsif(make.name == "Cadillac")
				make_id = 469
			elsif (make.name == "Jaguar")
				make_id = 442
			elsif (make.name == "Toyota")
				make_id = 448
			elsif (make.name == "Nissan")
				make_id = 478
			end


			url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetModelsForMakeIdYear/makeId/#{make_id}/vehicleType/#{add_underscore_type}?format=json"
			response = HTTParty.get(url)
				response["Results"].each do |car|
				model = Model.find_or_create_by(name: car["Model_Name"])
				model.make_id = make.id
				model.type_id = type.id
				model.save
				end
		end
	end
	
end


binding.pry
 


