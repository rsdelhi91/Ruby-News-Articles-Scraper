# This class is used to format the RSS feed scraped from The Age into a valid XML 
# representation. The XML formatting is done manually by placing the relevant data 
# in their tags. 
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require_relative 'news.rb'


class AgeXMLFormatter < News::Formatter

    # The super is used to initialize the values in the Formatter class
	def initialize 
		super
	end

    # This function is used to specify the format of the output file
	def extension
		"XML"
	end

    # This function is used to specify whether a header is present for the file
	def header?
		true
	end

    # This function is used to specify whether a footer is present for the file
	def footer?
		true
	end

    # This function is used to perform the formatting for the header of the file
	def header article
		"<articles: "+article.attributes.keys.join(' ')+">"+"\n<XML>"
	end

    # This function is used to perform the formatting for the footer of the file
	def footer article
		"</XML>"
	end
    
    # This function is used to format the article into the relevant XML representation
    # by placing the scraped article values in the tags written manually.
	def article_representation article
		s = "\t<article>\n"+"\t\t<title> "+article.attributes["title"]+" </title>\n"+
		"\t\t<summary> "+article.attributes["summary"]+" </summary>\n"+
		"\t\t<images> "+article.attributes["images"].to_s+" <images>\n"+
		"\t\t<source> "+article.attributes["source"]+" </source>\n"+
		"\t\t<date> "+article.attributes["date"].to_s+" </date>\n"+
		"\t</article>\n"
	end

end


