require "httparty"
require 'pry'

# class Api < ActiveRecord::Base
	def fetch_and_seed_vehicle
		url = "https://vpic.nhtsa.dot.gov/api/vehicles/GetMakesForVehicleType/car?format=json"
		response = HTTParty.get(url)
	
	end
# end


fetch_and_seed_vehicle