
class CentralPark::CLI 

    def call
        welcome
        get_menu
        get_user_input
        goodbye
    end

    def welcome 
        puts "Welcome to the central park of New York!"
        puts "======================================================"
        puts "Here are some of the highlighted activities here in the park"
    end

    def get_menu
        @menus = CentralPark::Menu.all
        print_menu
    end

    def goodbye
        puts "Thank you for visiting Central Park! See you soon!"
    end

    def get_user_input
        
        input = ""

        until input == "exit" || input == "e"
            puts "Please type in the number of the program you are interested in to see the details about it :"
            input = gets.strip.downcase

            get_details(input) if valid?(input)

            puts "Would you like to inquire about another program? Please type 'y' or 'n' :"
            if 
            else  
                puts "Invalid input. Please Only use numbers to select the program you would like to know more about or type 'exit' or 'e' quit the program."
            end
        end
    end

    def valid?(input)
        input.to_i > 0 && input.to_i <= CentralPark::Menu.all.length
    end

    def get_details(input)
        input = input.to_i
        program = CentralPark::Program.create_from_menu(input)
        print_details(program)
    end

    def print_details(program)
        puts ""
        puts "#{program.title}"
        puts "===================="
        puts "#{program.description}"
        puts "Location : #{program.location}"
        puts ""
    end

    def print_menu
        @menus.each.with_index(1) do |menu, idx|
            puts ""
            puts "#{idx}. #{menu.title}"
            puts menu.blurb
            puts "==========================="
        end
    end

end