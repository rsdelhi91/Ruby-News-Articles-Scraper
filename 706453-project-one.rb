# This is the driver program of our scraping application. This script registers our three sources, 
# namely: The Age, New York Times and The Herald Sun in the Scraper class in the News folder, and 
# calls the scrape method for them, thus initiating the scraping process for articles on the source 
# feed, and storing of all the available articles for us to use. The scraped data is formatted into 
# 3 formats, namely: XML, CSV and JSON. These files can be viewed in any text editor like notepad or
# sublime text.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require_relative 'news'
require_relative 'AgeImporter.rb'
require_relative 'AgeXMLFormatter.rb'
require_relative 'AgeCSVFormatter.rb'
require_relative 'AgeJSONFormatter.rb'
require_relative 'NYTImporter.rb'
require_relative 'NYTXMLFormatter.rb'
require_relative 'NYTCSVFormatter.rb'
require_relative 'NYTJSONFormatter.rb'
require_relative 'HSImporter.rb'
require_relative 'HSXMLFormatter.rb'
require_relative 'HSCSVFormatter.rb'
require_relative 'HSJSONFormatter'


# Create three scraper instances to register the source being scraped, its relevant importer, and its
# formatter for the 3 different output formats, namely: XML,JSON, and CSV.

scraper_one = News::Scraper.new
scraper_two = News::Scraper.new
scraper_three = News::Scraper.new


# Register the source and importer/formatter for all 3 sources.

scraper_one.register_source :Age, AgeImporter, AgeXMLFormatter
scraper_two.register_source :Age, AgeImporter, AgeCSVFormatter
scraper_three.register_source :Age, AgeImporter, AgeJSONFormatter

scraper_one.register_source :NYT, NYTImporter, NYTCSVFormatter
scraper_two.register_source :NYT, NYTImporter, NYTJSONFormatter
scraper_three.register_source :NYT, NYTImporter, NYTXMLFormatter

scraper_one.register_source :HS, HSImporter, HSJSONFormatter
scraper_two.register_source :HS, HSImporter, HSXMLFormatter
scraper_three.register_source :HS, HSImporter, HSCSVFormatter


# Run the scrape method for all 3 instances.
scraper_one.scrape
scraper_two.scrape
scraper_three.scrape
