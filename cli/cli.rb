require_relative '../config/environment'
require "pry"

puts "WELCOME TO USMAN'S WONDERFUL CAR DATABSE"
puts ""
puts "---------------------------------------"
puts ""
puts "Welcome to Usman's Car Data Universe!!!"
puts ""
puts "---------------------------------------"
puts ""

def exit
  puts "***********"
  puts "| Goodbye |"
  puts "***********"
end

def get_car_brand(user_input_type, user_name)
	puts "Please type 'exit' to exit the program."
	puts ""
	Make.all.each do |make|
  		puts "ID: #{make.id}. #{make.name}"
  	end
	car_brand = gets.chomp.to_i
	
  	if (car_brand.to_i == 0)
    return exit

  	elsif (Make.exists?(car_brand))
  		puts "Here is a list of all **  #{Make.find(car_brand).name} #{Type.find(user_input_type).name} ** in our inventory:"
  		puts ""
  		
  		nil_test = Model.find_by(make_id: "#{car_brand}", type_id: "#{user_input_type}")
  			if(nil_test == nil)
  				puts " I am sorry currently we do not have any #{Make.find(car_brand).name} #{Type.find(user_input_type).name} in our inventory.\n Would you like to try again with a different 'type' and 'brand'?\n Please type 'yes' or 'no' to continue:"
  				try_again_input = gets.chomp.downcase
  				if (try_again_input == "no")
  					return exit
  				else
  					return user_intro
  				end
  			end
  		Model.all.each do |model|
  			if (model.make_id == car_brand && model.type_id == user_input_type)
  				puts "Model_Id: #{model.id}. #{model.name}"
  			end
  			
  		end
  		puts "Please make your selection by entering the 'Model_Id' and your vehicle will be delivered to your doorstep within 3 business days"
  		user_inpit_choose_model = gets.chomp.to_i
  		final_sales(user_inpit_choose_model, car_brand, user_name)
  		else

    	puts ""
    	puts "PLEASE CHOOSE A VALID ENTRY"
    	get_car_brand
    end
  end

  def final_sales(user_inpit_choose_model, car_brand, user_name)
  	puts "#{Make.find(car_brand).name} #{Model.find(user_inpit_choose_model).name} is an excelellent choice.\n This vehicle comes with a five year warranty and 3 complimentary oil changes."
  	puts ""
  	puts "Please enter your address for delivery:"
  	user_address = gets.chomp
  	puts ""
  	puts "Please enter your phone number"
  	puts ""
  	user_number = gets.chomp
  	puts ""
  	puts "Thank you so much '#{user_name} for shopping with us, we really appreciate your business.\n Before you go would you like to rate your experience at our dealership today?\n Input 'yes' or 'no' to continue:"
  	puts ""
  	user_rating = gets.chomp
  	if(user_rating == "yes")
  		10.times do |n|
  			puts n+1
  		end
  		puts ""
  		puts "Please enter your selection below (1 = poor, 10 = Very Satisfied)"
  		puts ""
  		user_feedback = gets.chomp
  		puts "Thank you once again for your feed back and your business.\n \nIt was a pleasure doing business with you.\n Please recommend us to friends and family and hope to see you again."
  		puts ""
  		puts "Good Bye! #{user_name}"
  	else
  		puts "Good Bye! #{user_name}"
  end
end

	def get_car_type(user_name)

	Type.all.each do |type|
		puts "ID:#{type.id}. #{type.name}."
	end
	puts ""
	puts" Please enter the Id Number of the type of vehicle you are interested in:"
  	car_type_validater = Type.all.collect do |type|
  							type.id
  						end
  	user_input_type = gets.chomp.to_i
    

  	if user_input_type == "exit"
    	return exit
  	elsif car_type_validater.include?(user_input_type)
    	puts "----------------------------------------"
    	puts "GREAT! Please choose a car brand"
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
  puts ""
  puts "What is your name?"
  puts ""
  user_name = gets.chomp
  if user_name.downcase == "exit"
    exit
  elsif user_name == nil || user_name == ""
    get_name
  else
    puts " '1' * 20"
    puts " '2' * 20"
    # puts "Hi #{name}! What kind of car you inquiring about?"
    puts "Hi #{user_name.upcase}! Please choose a VEHICLE TYPE"
    get_car_type(user_name)
  end
end

user_intro

