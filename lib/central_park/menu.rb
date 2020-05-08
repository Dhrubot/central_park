class CentralPark::Menu
    
    attr_accessor :title, :blurb, :link

    @@all = []

    def initialize(title, blurb, link)
        @title = title
        @blurb = blurb
        @link = link
        @@all << self
    end

    def self.all
        CentralPark::Scraper.menu_scraper if @@all.empty?
        @@all
    end
 
end