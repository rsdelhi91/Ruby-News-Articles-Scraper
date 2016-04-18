# This class is used to format the data scraped from the RSS feed for The Age into  
# CSV format for use by us. It performs the viable formatting required to attain
# the header, footer and its respective body in a valid CSV format, to be viewed in 
# any Text Editor.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require_relative 'news.rb'


class AgeCSVFormatter < News::Formatter

    # The super is used to initialize the values in the Formatter class.
	def initialize
		super
	end

    # This function is used to specify the format of the output file.
	def extension
		"csv"
	end

    # This function is used to specify whether a header is present for the file.
	def header?
		true
	end

    # This function is used to specify whether a footer is present for the file.
	def footer?
		false
	end

    # This function is used to perform the formatting for the header of the file.
	def header article
		article.attributes.keys.join(', ')
	end

    # This function is used to perform the formatting for the body of the file.
	def article_representation article
		article.attributes.values.map(&:to_s).join(', ')
	end

end
