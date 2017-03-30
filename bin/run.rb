require_relative '../config/environment'

require "httparty"
require 'pry'


def fetch_and_seed_vehicle_type
url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetVehicleTypesForMake/merc?format=json"
response = HTTParty.get(url)
	response["Results"].each do |car|
		if(car["VehicleTypeName"] == "Passenger car" || car["VehicleTypeName"] == "Truck ")
        Type.find_or_create_by(name: car["VehicleTypeName"])
        end
	end
end


def fetch_and_seed_makes
url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetMakesForVehicleType/car?format=json"
response = HTTParty.get(url)
	response["Results"].each do |car|
		if(car["MakeName"] == "Ford" || car["MakeName"] == "Honda" || car["MakeName"] == "Acura" || car["MakeName"] == "Lexus" || car["MakeName"] == "BMW" || car["MakeName"] == "Mercedes-Benz" || car["MakeName"] == "Cadillac" || car["MakeName"] == "Jaguar" || car["MakeName"] == "Toyota" || car["MakeName"] = "Nissan")
        Make.find_or_create_by(name: car["MakeName"].downcase)
        end

	end	
end


def fetch_and_seed_models
	new_array = []
	make_ids = [460, 474, 475, 515, 452, 449, 469, 442, 448, 478]
	make_id = 0
	Make.all.each do |make|
		Type.all.each do |type|
			type = type.name.gsub(" ", "_")
			
			if (make.name == "ford")
				make_id = 460
			elsif (make.name == "honda")
				make_id = 474
			elsif (make.name == "acura")
				make_id = 475
			elsif (make.name == "lexus")
				make_id = 515
			elsif (make.name == "bmw")
				make_id = 452
			elsif (make.name == "mercedes-benz")
				make_id = 449
			elsif(make.name == "cadillac")
				make_id = 469
			elsif (make.name == "jaguar")
				make_id = 442
			elsif (make.name == "toyota")
				make_id = 448
			elsif (make.name == "nissan")
				make_id = 478
			end


			url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetModelsForMakeIdYear/makeId/#{make_id}/vehicleType/#{type}?format=json"
			response = HTTParty.get(url)
				response["Results"].each do |car|
					binding.pry
				model = Model.find_or_create_by(car["Model_Name"])
				model.make = make.id
				model.type = type.id
				model.save
				end
			
		end
	end
	
end

fetch_and_seed_vehicle_type
#fetch_and_seed_makes
binding.pry
 


