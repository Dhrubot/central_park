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
        location = details.css(".c-info-column-section p em").text

        CentralPark::Program.new(title, description, location)
    end
end