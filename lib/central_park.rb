require "Nokogiri"
require "pry"
require "open-uri"
require "colorize"

require_relative "./central_park/version"
require_relative "./central_park/program"
require_relative "./central_park/menu"
require_relative "./central_park/scraper"
require_relative "./central_park/cli"

module CentralPark
  class Error < StandardError; end
  # Your code goes here...
end


