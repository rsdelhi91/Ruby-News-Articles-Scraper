# This class scrapes the data from the JSON source: New York Times, based on the link 
# provided in the scrape function. Following which, we pass the scraped data into 
# specific keys to create a generic format for us to store the data temporarily.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require 'open-uri'
require 'json'
require 'net/http'
require 'Date'
require_relative 'news.rb'
require_relative 'NYTArticle.rb'


class NYTImporter < News::Importer

    # We call super to initialize the superclass constructor
	def initialize start_date, end_date
		super
	end

	# Define the class method for file_name. It states the source
    # being scraped.
	def self.source_name
		"NYT"
	end

    # This method scrapes the data from the JSON source for New York Times
    # and passes it into its specific version of Article, having attributes 
    # which are accessible via the data scraped. In this, since the JSON
    # source does not have any authors nor images, it is assigned as Nil to
    # specify that we do not have either of those data in the scraped articles.
	def scrape
		@article_arr = []		
        url = 'http://api.nytimes.com'
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        #If the api being scraped uses https, then set use_ssl to true.
        #http.use_ssl = false
        request_url = '/svc/search/v2/articlesearch.json?q=bangkok+bombings&page=1&sort=newest&api-key=e89effddaf8553d3a95336aaf6882ebe:5:72702694'
        response = http.send_request('GET', request_url)
        article_parse = JSON.parse(response.body)
        article_data= article_parse['response']['docs']
        puts "Title: The New York Times"
        puts "--------------------------------"
        article_data.each do |v|
           @article_arr << NYTArticle.new(author: "nil", title: v['headline']['main'].to_s.gsub(/,/,'.'), summary: v['snippet'].to_s.gsub(/,/,'.'), 
            images: "nil", source: v['web_url'], date: v['pub_date'].to_s.gsub(/,/,'.'), document_type: v['document_type'], section_name: v['section_name'])
        end
       @articles.concat(@article_arr)
	end

end