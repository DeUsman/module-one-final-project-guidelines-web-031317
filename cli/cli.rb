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

def car_sketch
  puts "          __---~~~~--__                      __--~~~~---__               ".color(:blue)
puts "         `l---~~~~~~~~ll                    //~~~~~~~~---/'          ".color(:blue)
puts "          l/~~~~~~~~~l||                  ||/~~~~~~~~~l/                 ".color(:blue)
puts "                      `ll                //'                                         ".color(:blue)
puts "                       `ll            //'                                                ".color(:blue)
puts "                         ||          ||                                              ".color(:blue)
puts "                _____--~~~~~~~~~~~~~~~~~~--______                ".color(:blue)
puts "          ___ // _-~                        ~-_ ll ___               ".color(:blue)
puts "         `l__)l/~                              ~l/(__/'          ".color(:blue)
puts "           _--`-___                            ___-'--_              ".color(:blue)
puts "         /~     `l ~~~~~~~~------------~~~~~~~~ /'     ~l            ".color(:blue)
puts "         /|        `l         ________         /'        |l      ".color(:blue)
puts "       | `l   ______`l_      l------/      _/'______   /' |    ".color(:blue)
puts "       |   `l_~-_____l ~-________________-~ /_____-~_/'   |      ".color(:blue)
puts "       `.     ~-__________________________________-~     .'      ".color(:blue)
puts "        `.      [_______/------|~~|------l_______]      .'           ".color(:blue)
puts "         `l--___((____)(________l/________)(____))___--/'            ".color(:blue)
puts "          |>>>>>>||                            ||<<<<<<|                 ".color(:blue)
puts "          `l<<<<</'                            `l>>>>>/' ".color(:blue)

end

def welcome_sketch
puts "     *********************************************".color(:white).background(:magenta)
puts ""
puts "     *  WELCOME TO USMAN AND DANIEL BEST CAR UNIVERSE!!!  *".color(:black).background(:magenta)
puts ""
puts "     *********************************************".color(:white).background(:magenta)
car_sketch
end

def welcome_intro
system "clear"

puts ""
puts "************************************************".color(:white).background(:magenta)
puts ""
puts "WELCOME TO USMAN AND DANIEL BEST CAR UNIVERSE!!!".color(:black).background(:magenta)
puts ""
puts "************************************************".color(:white).background(:magenta)
puts ""
puts ""
 welcome_message
end

def welcome_message
  car_sketch
  puts ""
  puts ""
puts "What would you like to do today:\n".color(:green).background(:black)
puts "1.Type 1 to Enter the Dealer Mode.".color(:white).background(:blue)
puts "2.Type 2 to Enter the customer mode.".color(:white).background(:blue)
puts "\n3.Type 3 to Exit".color(:black).background(:red)
user_first_choice = gets.chomp.to_i
  
  if (user_first_choice == 1)
       return dealer_mode
  elsif (user_first_choice == 2)
      user_intro 
  elsif (user_first_choice == 3)
      return exit
  else
    puts "Please enter a valid entry."
    return welcome_message
  end

end

def dealer_mode
 system "clear"
 puts "\nPlease make your selection using the ID#:".color(:green).background(:black)
 puts "\n1.Type 1 to Count All Inventory.".color(:white).background(:blue)
 puts "2.Type 2 to Count Inventory By Make.".color(:white).background(:blue)
 puts "3.Type 3 to Exit.\n".color(:white).background(:blue)
 puts ""
 user_input = gets.chomp.to_i
 puts ""
  if(user_input == 1)
    system "clear"
    puts "\n"
     puts "Currently you have a total of #{Model.all.count} vehicles in stock.".color(:black).background(:red)
     puts ""
     puts "What would you like to do now:".color(:green).background(:black)
     puts ""
     puts "1.Type 1 to Go back to the Dealer Mode.".color(:white).background(:blue)
     puts "2.Type 2 to Go to the Customer Mode.".color(:white).background(:blue)
     puts "3.Type 3 to Exit the Programm.".color(:white).background(:blue)
     puts ""
     user_input2 = gets.chomp.to_i
      if(user_input2 == 1)
        return dealer_mode
      elsif(user_input2 == 2)
        return user_intro 
      elsif(user_input2 == 3)
        return exit
      else
        puts "Please make a Valid Selection.".color(:black).background(:red)
        return dealer_mode
      end

  elsif (user_input == 2)
    system "clear"
    puts "\n"
    puts "Please choose a make to count inventory from:".color(:green).background(:black)
    puts ""
    Make.all.each do |make|
      puts "#{make.id}. #{make.name}"
    end

    puts ""
    user_input3 = gets.chomp.to_i
    system "clear"
    make = Make.find_by_id(user_input3)
    
    puts "Currently you have #{make.models.count} #{Make.find(user_input3).name} vehicles in stock.".color(:black).background(:red)
    puts ""
    puts "Where would you like to go from here:".color(:black).background(:red)
    puts ""
    puts "1.Type 1 to enter Dealer Mode again.".color(:white).background(:blue)
    puts "2.Type 2 to enter Customer Mode.".color(:white).background(:blue)
    puts "3.Type 3 to Exit the Application.".color(:white).background(:blue)
    puts ""
    user_input4 = gets.chomp.to_i
        if (user_input4 == 1) 
          return dealer_mode
        elsif (user_input4 == 2)
          return user_intro 
        elsif (user_input4 == 3)
          return exit
        else
          puts "Please enter a Valid Entry.".color(:black).background(:red)
          return dealer_mode
        end
  elsif (user_input == 3)
    return exit
  else 
    return dealer_mode
  end
end

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
  		final_sales(user_input_type, user_input_choose_model,car_brand, user_name)
      
      end
  		else
        system "clear"
    	puts "".color(:red).background(:black)
    	puts "PLEASE CHOOSE A VALID ENTRY".color(:red).background(:black)
    	get_car_brand(user_input_type, user_name)
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
  	puts "Thank you so much '#{user_name} for shopping with us, we really appreciate your business.\n\nBefore you go would you like to rate your experience at our dealership today?\nInput 'yes' or 'no' to continue:".color(:green).background(:black)
  	puts ""
  	user_rating = gets.chomp
  	system "clear"
  	if(user_rating == "yes")
  		10.times do |n|
  			puts "\n#{n+1}".color(:red)
  		end
  		puts ""
  		puts "Please enter your selection below (1 = poor, 10 = Very Satisfied)".color(:green).background(:black)
  		puts ""
  		user_feedback = gets.chomp
  		system "clear"
  		puts "Thank you once again for your feed back and your business.\n\nIt was a pleasure doing business with you.\nPlease recommend us to friends and family and hope to see you again.".color(:green).background(:black)
  		puts ""
      puts "Your #{Make.find(car_brand).name}-#{Model.find(user_input_choose_model).name} will be delivered to your address in the next ten(10) business days.".color(:green).background(:black)
  		puts ""
      puts "Please proceed to the cashier to make a payment on your #{Make.find(car_brand).name}."
      puts "Good Bye from the sales team #{user_name}\n"
  		1.times do 
  		puts "A web page will open to congratulate you on your purchase.".color(:black).background(:red)
  		sleep(10)
  		end
  		Sale.create(customer_name: "user_name", vehicle_model: "#{Model.find(user_input_choose_model).name}", vehicle_make: "#{Make.find(car_brand).name}", vehicle_type: "#{Type.find(user_input_type).name}", vehicle_cost: "????", address: user_address, phone: user_number, rating: user_feedback)
        system("open https://www.youtube.com/watch?v=LlhKZaQk860")
        return exit
    else
     	user_feedback = nil
    	system "clear"
  		puts "It was a pleasure doing business with you.\nPlease recommend us to friends and family and hope to see you again.".color(:green).background(:black)
  		puts ""
      puts "Your #{Make.find(car_brand).name}-#{Model.find(user_input_choose_model).name} will be delivered to your address in the next ten(10) business days.".color(:green).background(:black)
  		puts "Please proceed to the cashier to make a payment on your #{Make.find(car_brand).name}."
      puts "Good Bye from the sales team #{user_name}\n"
  		1.times do 
  			puts "A web page will open to congratulate you on your purchase.".color(:black).background(:green)
  			sleep(10)
  		end
  		Sale.create(customer_name: "user_name", vehicle_model: "#{Model.find(user_input_choose_model).name}", vehicle_make: "#{Make.find(car_brand).name}", vehicle_type: "#{Type.find(user_input_type).name}", vehicle_cost: "????", address: user_address, phone: user_number, rating: user_feedback)
        system("open https://www.youtube.com/watch?v=LlhKZaQk860")
        return exit
    end
    car_sketch
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
  system "clear"
  welcome_sketch
  puts "What is your name?".color(:green).background(:black)
  puts ""
  user_name = gets.chomp
  if user_name.downcase == "exit"
  	system "clear"
    exit
  elsif user_name == nil || user_name == ""
    user_intro
  else
  	system "clear"
    puts "------------------------"

    # puts "Hi #{name}! What kind of car you inquiring about?"
    puts "Hi #{user_name.upcase}! Please choose a VEHICLE TYPE".color(:red)

    get_car_type(user_name)
  end
end


welcome_intro


