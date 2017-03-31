require_relative '../config/environment'
require "pry"
require "rainbow"
require 'net/http'
require 'rest-client'
require 'json'

def black_color
	puts "                                                                                                                                                                                     ".background(:red)
	puts "                                                                                                                                                                                     ".background(:black)
	puts "                                                                                                                                                                                     ".background(:blue)
end

system "clear"
20000.times do 
	black_color 
	puts "LOADING APPLICATION PLEASE WAIT.......................................                                                                                                               ".color(:black).background(:white)
end

system "clear"

puts ""
puts "***************************************".color(:white).background(:magenta)
puts ""
puts "Welcome to Usman's Car Data Universe!!!".color(:black).background(:magenta)
puts ""
puts "***************************************".color(:white).background(:magenta)
puts ""
#pid = fork{ exec '06 - Mano Ya Na Mano [Songs.PK]','-q', file }

def exit
system "clear"
	20000.times do 
	black_color 
	puts "EXITING APPLICATION PLEASE WAIT.......................................".color(:black).background(:white)
	end
	system "clear"
  puts "******************".color(:red).background(:black)
  puts "******************".color(:red).background(:black)
  puts "******************".color(:red).background(:black)
  puts "| G o o d  b y e |".color(:red).background(:black)
  puts "******************".color(:red).background(:black)
  puts "******************".color(:red).background(:black)
  puts "******************".color(:red).background(:black)
end

def get_car_brand(user_input_type, user_name)
	puts ""
	Make.all.each do |make|
  		puts "ID: #{make.id}. #{make.name}".color(:white).background(:blue)
  	end
  	puts "\nPlease type 'exit' to exit the program.\n".color(:red).background(:black)

	car_brand_string = gets.chomp
	car_brand = car_brand_string.to_i
	
  	if (car_brand_string == "exit")
  		system "clear"
    return exit

  	elsif (Make.exists?(car_brand))
  		system "clear"
  		puts "Here is a list of all ** #{Make.find(car_brand).name}-#{Type.find(user_input_type).name} ** in our inventory:".color(:green).background(:black)
  		puts ""
  		
  		nil_test = Model.find_by(make_id: "#{car_brand}", type_id: "#{user_input_type}")
  			if(nil_test == nil)
  				puts " I am sorry currently we do not have any #{Make.find(car_brand).name} #{Type.find(user_input_type).name} in our inventory.\n Would you like to try again with a different 'type' and 'brand'?\n Please type 'yes' or 'no' to continue:".color(:red)
  				try_again_input = gets.chomp.downcase
  				if (try_again_input == "no")
  					return exit
  				else
  					return user_intro
  				end
  			end
  			Model.all.each do |model|
  					if (model.make_id == car_brand && model.type_id == user_input_type)
  					puts "Model_Id: #{model.id}. #{model.name}".color(:white).background(:blue)
  					end
  				
  		end
  		puts "\nPlease make your selection by entering the 'Model_Id':".color(:green).background(:black)
  		puts "\nTo quit, type 'EXIT'.".color(:white).background(:black)
  		
  		user_input_choose_model_string = gets.chomp
  		user_input_choose_model = user_input_choose_model_string.to_i
  		if (user_input_choose_model_string == "exit")
  		return exit
  		elsif (Model.find(user_input_choose_model))
  		final_sales(user_input_type,user_input_choose_model, car_brand, user_name)
  		else
    	puts "".color(:red).background(:black)
    	puts "PLEASE CHOOSE A VALID ENTRY".color(:red).background(:black)
    	get_car_brand(user_input_type, user_name)
    end
	end
 end

  def final_sales(user_input_type, user_input_choose_model, car_brand, user_name)
  	system "clear"
  	puts "#{Make.find(car_brand).name} #{Model.find(user_input_choose_model).name} is an excelellent choice.\nThis vehicle comes with a five year warranty and 3 complimentary oil changes.".color(:black).background(:yellow)
  	puts ""
  	puts "Please enter your address for delivery:".color(:green).background(:black)
  	puts "You can type 'EXIT' to exit the application:\n".color(:black)
  	user_address = gets.chomp
  	if (user_address == 'exit' || user_address == 'EXIT')
  		return exit
  	end
  	puts ""
  	puts "Please enter your phone number.".color(:green).background(:black)
  	puts "You can type 'EXIT' to exit the application:\n".color(:black)
  	
  	user_number = gets.chomp
  	if(user_number == 'exit' || user_number == 'EXIT')
  		return exit
  	end
  	system "clear"
  	puts ""
  	puts "Thank you so much '#{user_name} for shopping with us, we really appreciate your business.\nBefore you go would you like to rate your experience at our dealership today?\nInput 'yes' or 'no' to continue:".color(:green).background(:black)
  	puts ""
  	user_rating = gets.chomp
  	system "clear"
  	if(user_rating == "yes")
  		10.times do |n|
  			puts "\n#{n+1}".color(:red)
  		end
  		puts ""
  		puts "Please enter your selection below (1 = poor, 10 = Very Satisfied)"
  		puts ""
  		user_feedback = gets.chomp
  		system "clear"
  		puts "Thank you once again for your feed back and your business.\n\nIt was a pleasure doing business with you.\nPlease recommend us to friends and family and hope to see you again."
  		puts ""
  		puts "Good Bye! #{user_name}\n"
  		1.times do 
  			puts "A web page will open to congratulate you on your purchase."
  			sleep(5)
  		end
  		Sale.create(customer_name: "user_name", vehicle_model: "#{Model.find(user_input_choose_model).name}", vehicle_make: "#{Make.find(car_brand).name}", vehicle_type: "#{Type.find(user_input_type).name}", vehicle_cost: "????", address: user_address, phone: user_number, rating: user_feedback)
        system("open https://www.youtube.com/watch?v=LlhKZaQk860")
        return exit
    else
     	user_feedback = 0
    	system "clear"
  		puts "Thank you once again for your feed back and your business.\n\nIt was a pleasure doing business with you.\nPlease recommend us to friends and family and hope to see you again."
  		puts ""
  		puts "Good Bye! #{user_name}\n"
  		1.times do 
  			puts "A web page will open to congratulate you on your purchase."
  			sleep(5)
  		end
  		Sale.create(customer_name: "user_name", vehicle_model: "#{Model.find(user_input_choose_model).name}", vehicle_make: "#{Make.find(car_brand).name}", vehicle_type: "#{Type.find(user_input_type).name}", vehicle_cost: "????", address: user_address, phone: user_number, rating: user_feedback)
        system("open https://www.youtube.com/watch?v=LlhKZaQk860")
        return exit
    end
end

	def get_car_type(user_name)
	system "clear"
	"\n"
	"\n"
	Type.all.each do |type|
		puts "\n#{type.id}. #{type.name}.".color(:white).background(:blue)
	end
	puts ""
	puts"#{user_name.capitalize} please enter the Id Number of the type of vehicle you are interested in:\n".color(:green).background(:black)
  	car_type_validater = Type.all.collect do |type|
  							type.id
  						end
  	user_input_type_string = gets.chomp
  	user_input_type = user_input_type_string.to_i
    

  	if user_input_type_string == "exit"
  		system "clear"
    	return exit
  	elsif car_type_validater.include?(user_input_type)
  		system "clear"
    	puts "----------------------------------------"
    	puts "GREAT! You have choosen #{Type.find(user_input_type).name}.\n\nNow please select the 'MAKE' of the vehicle:".color(:green).background(:black)
    	puts ""
    	get_car_brand(user_input_type, user_name)
  	else
    puts ""
    puts "PLEASE CHOOSE A VALID ENTRY"
    get_car_type(user_name)
  end
end
#-----------------------------------------------------------------

def user_intro
  puts "What is your name?".color(:green).background(:black)
  puts ""
  user_name = gets.chomp
  if user_name.downcase == "exit"
  	system "clear"
    exit
  elsif user_name == nil || user_name == ""
    get_name
  else
  	system "clear"
    puts "------------------------"

    # puts "Hi #{name}! What kind of car you inquiring about?"
    puts "Hi #{user_name.upcase}! Please choose a VEHICLE TYPE".color(:red)

    get_car_type(user_name)
  end
end


user_intro


