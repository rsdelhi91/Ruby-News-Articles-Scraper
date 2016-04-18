# This class scrapes the data from the RSS feed: The Age based on the link provided 
# in the scrape function. Following which, we pass the scraped data into specific keys 
# to create a generic format for us to store the data temporarily.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require 'Date'
require 'rss'
require 'open-uri'
require_relative 'news.rb'
require_relative 'AgeArticle.rb'


class AgeImporter < News::Importer
    
    # We call super to initialize the superclass constructor.
	def initialize start_date, end_date
		super 
	end

    # Define the class method for file_name. It states the source.
    # being scraped.
	def self.source_name
		"Age"
	end

    # This method scrapes the data from the RSS feed for the Age and 
    # passes it into its specific version of Article, having attributes
    # which are accessible via the data scraped. Since we do not have
    # any authors mentioned for any of the articles being scraped, I 
    # have specified them as nil here. But If we choose another source 
    # which does have authors, we can easily add them by including them 
    # in the AgeArticle class and then use it here.
	def scrape
        @article_arr = []
		url = 'http://www.theage.com.au/rssheadlines/technology-news/article/rss.xml'
        open(url) do |rss|
        	feed = RSS::Parser.parse(rss, false)
            puts " "
            puts "*********************************"
        	puts "Title: #{feed.channel.title}"
            puts "--------------------------------"
            feed.items.each do |item|
            	@article_arr << AgeArticle.new(author: "nil", title: item.title.to_s.gsub(/,/,''), 
                summary: (item.description).match(/\<\/p\>[\w ?,''""]+/).to_s.gsub(/\<\/p\>/,'').gsub(/,/,'').gsub(/\"/,''), 
                images: (item.description).match(/http.+\.(jpg|png)/), source: item.link, date: item.pubDate.to_s.gsub(/,/,''))
            end
        end
       @articles.concat(@article_arr)
    end

end
