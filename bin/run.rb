require_relative '../config/environment'

require "httparty"
require 'pry'


def fetch_and_seed_vehicle_type
url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetVehicleTypesForMake/merc?format=json"
response = HTTParty.get(url)
	response["Results"].each do |car|
		if(car["VehicleTypeName"] == "Passenger car" || car["VehicleTypeName"] == "Truck " || car["VehicleTypeName"] == "Bus" || car["VehicleTypeName"] == "Trailer")
        Type.find_or_create_by(name: car["VehicleTypeName"].downcase)
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


def fetch_and_seed_models_for_ford_passenger_cars
url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetModelsForMakeIdYear/makeId/460/vehicleType/passenger_car?format=json"
response = HTTParty.get(url)
	response["Results"].each do |car|
        Make.find_or_create_by(name: car["MakeName"].downcase)
        end

	end
end


