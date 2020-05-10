class CentralPark::Scraper
    def self.menu_scraper
        doc = Nokogiri::HTML(open("https://www.centralparknyc.org/whats-happening"))
        menu_elements = doc.css(".media")

        menu_elements.each do |ele|
            title = ele.css(".title").text.gsub /^\s+/, ""
            blurb = ele.css(".content p").text
            link = ele.css("a").attr("href").value
            CentralPark::Menu.new(title, blurb, link)
        end
    end

    def self.program_details_scraper(menu)
        url = "https://www.centralparknyc.org#{menu.link}"   
        
        doc = Nokogiri::HTML(open(url))
        details = doc.css(".u-two-up")
        title = doc.css("h1").text
        description = details.css(".richText p").text
        optional_item = doc.css(".c-info-column-section")
        # location = details.css(".c-info-column-section p em").text
        location, age,schedule,cost,availability = nil
        
        optional_item.each do |item|
            if item.text.include?("Location")
                location = item.css("p em").text.strip
            elsif item.text.include?("Age")
                age = item.css("p").text.strip
            elsif item.text.include?("When")
                schedule = item.css("p").text.strip
            elsif item.text.include?("Cost")
                cost = item.css("p").text.strip
            elsif item.text.include?("Groups")
                availability = item.css("p").text.gsub(" Learn more.", "")
            end
        end

        CentralPark::Program.new(title, description, location, age, schedule, cost, availability)
    end
end