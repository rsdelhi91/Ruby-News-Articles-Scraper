# This class scrapes the data from the RSS feed: the Herald Sun based on the link 
# provided in the scrape function. Following which, we pass the scraped data into 
# specific keys to create a generic format for us to store the data temporarily.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require 'Date'
require 'rss'
require 'open-uri'
require_relative 'news.rb'
require_relative 'HSArticle.rb'


class HSImporter < News::Importer

    # We call super to initialize the superclass constructor.
	def initialize start_date, end_date
		super
	end

    # Define the class method for file_name. It states the source
    # being scraped.
	def self.source_name
		"HS"
	end

    # This method scrapes the data from the RSS feed for Herald Sun and 
    # passes it into its specific version of Article, having attributes 
    # which are accessible via the data scraped. This source may provide
    # data which has unexpected symbols in certain places. This is because
    # this parser cannot parse all types of punctuation (possibly non-ASCII)
    # , hence replaces them with symbols. Since we do not have any authors 
    # mentioned for any of the articles being scraped, I have specified 
    # that as nil here.
	def scrape
        @article_arr = []
		url = 'http://feeds.news.com.au/heraldsun/rss/heraldsun_news_technology_2790.xml'
        open(url) do |rss|
        	feed = RSS::Parser.parse(rss, false)
        	puts "Title: #{feed.channel.title}"
            puts "*********************************"
            puts " "
            feed.items.each do |item|
            	@article_arr << HSArticle.new(author: "nil", title: item.title.to_s.gsub(/,/,' ').gsub(/"/,' ').gsub(/'s/,'s').gsub(/'/, ''), 
                summary: item.description.to_s.gsub(/,/,' ').gsub(/\"/,'\'').gsub(/'s/,''), images: item.enclosure.url, source: item.link,
                date: item.pubDate.to_s.gsub(/,/,'').gsub(/\"/,'\'').gsub(/'s/,''))
            end
        end
       @articles.concat(@article_arr)
    end

end
