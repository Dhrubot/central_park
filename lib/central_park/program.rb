class CentralPark::Program 

    attr_accessor :title, :description, :location, :age, :schedule, :cost, :availability

    @@all = []

    def initialize(title, description, location = nil, age = nil, schedule = nil, cost = nil, availability = nil)
        @title = title
        @description = description
        @location = location
        @age = age
        @schedule = schedule
        @cost = cost
        @availability = availability
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