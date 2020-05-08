class CentralPark::Program 

    attr_accessor :title, :description, :location

    @@all = []

    def initialize(title, description, location)
        @title = title
        @description = description
        @location = location
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.create_from_menu(user_choice)
        menu = CentralPark::Menu.all[user_choice - 1]
        CentralPark::Scraper.program_details_scraper(menu)
    end
end