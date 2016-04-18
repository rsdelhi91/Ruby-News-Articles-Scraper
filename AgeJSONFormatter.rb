# This class is used to format the RSS feed scraped from The Age into a valid JSON 
# format. The JSON library is used to convert the data stored in the article hash into 
# JSON followed by some manual formatting to ensure a valid JSON format in the output 
# file. 
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require 'json'
require_relative 'news.rb'


class AgeJSONFormatter < News::Formatter

    # The super is used to initialize the values in the Formatter class. Following that, 
    # the variable count is set to ensure that the first call of the article_representation
    # function does not include a comma, to maintain a valid JSON format. 
	def initialize
		super
		@@count = 0
	end

    # This function is used to specify the format of the output file.
	def extension
		"json"
	end

    # This function is used to specify whether a header is present for the file.
	def header?
		true
	end

    # This function is used to specify whether a footer is present for the file.
	def footer?
		true
	end

    # This function is used to perform the formatting for the header of the file.
	def header article
		"{ \"The Age\":{"
	end
   
    # This function is used to perform the formatting for the footer of the file.
	def footer article
		"}}"
	end

	# This function formats the body of the JSON file, created using the data stored
	# in the article hash for this source. When the function is called for the first 
	# time, it will write the body of the article in JSON format using the JSON library
	# in Ruby, without a comma in its prefix. Else, it will write the article in JSON 
	# format with a comma at the start to maintain correctness of the JSON formatting.
	def article_representation article
        if @@count == 0 then
          @@count = 1
		  "\"articles\":"+article.attributes.to_json
        else
          ", \"articles\":"+article.attributes.to_json
        end
	end

end

