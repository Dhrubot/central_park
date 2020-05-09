
class CentralPark::CLI 

    def call
        welcome
        get_menu
        get_user_input
        goodbye
    end

    def get_menu
        @menus = CentralPark::Menu.all
        print_menu
    end

    def goodbye
        puts ""
        puts "Thank you for visiting Central Park! Come Back soon!".light_blue
        puts ""
        exit
    end

    def get_user_input
        input = ""
        while input != "quit" || input != "q"
            puts "To learn more details about the program you are interested in, Please type in the program number or type 'quit' or 'q' to exit the program:".cyan
            input = gets.strip.downcase

            if valid?(input)
                get_details(input)
            elsif input == "quit" || input == "q"
                goodbye
            else
                not_valid
                print_menu 
            end 

            puts ""
            puts ""
            puts "Would you like to inquire about another program? Please type 'y'/'n':"
            puts ""
            input = gets.strip.downcase
                
            if input == "y"
                print_menu
            elsif input == "n"
                goodbye
            else  
                not_valid
            end
        end 
    end

    def valid?(input)
        input.to_i > 0 && input.to_i <= CentralPark::Menu.all.length
    end

    def not_valid
        puts "Invalid input. Please only use number to select a program/activity.".light_red
        sleep(5)
    end

    def get_details(input)
        input = input.to_i
        program = CentralPark::Program.create_from_menu(input)
        print_details(program)
    end

    def print_details(program)
        puts ""
        puts ""
        puts ""
        puts "#{program.title}".green
        puts "===============================================================".blue
        puts "#{program.description}"
        puts ""
        puts "Location : #{program.location}".light_cyan
        puts ""
        puts ""
        puts ""
    end

    def print_menu
        @menus.each.with_index(1) do |menu, idx|
            puts ""
            puts "#{idx}. #{menu.title}".cyan
            puts menu.blurb
            puts "===============================================================".blue
            puts ""
        end
    end


    def welcome 

        puts <<~DOC.blue




                 .d8888b.                    888                    888      8888888b.                  888      
                d88P  Y88b                   888                    888      888   Y88b                 888      
                888    888                   888                    888      888    888                 888      
                888         .d88b.  88888b.  888888 888d888 8888b.  888      888   d88P 8888b.  888d888 888  888 
                888        d8P  Y8b 888 "88b 888    888P"      "88b 888      8888888P"     "88b 888P"   888 .88P 
                888    888 88888888 888  888 888    888    .d888888 888      888       .d888888 888     888888K  
                Y88b  d88P Y8b.     888  888 Y88b.  888    888  888 888      888       888  888 888     888 88b 
                 "Y8888P"   "Y8888  888  888  "Y888 888    "Y888888 888      888       "Y888888 888     888  888 
                                                                                                                                                                                            
                                                                                                    

        
                            ===============================================================
                                        Welcome to The Central Park of New York!
                            ===============================================================
        

                            The opportunities to engage with Central Park are as diverse as the City it calls home.

                            Here is a list of our year-round Daily Programs & Activities:
  
        DOC

        sleep(7)
   end

end