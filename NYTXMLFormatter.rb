# This class is used to format the articles scraped from New York Times into a valid 
# XML representation. The XML formatting is done manually by placing the relevant data 
# in their tags. 
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

require_relative 'news.rb'


class NYTXMLFormatter < News::Formatter

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
		"\t\t<source> "+article.attributes["source"]+" </source>\n"+
		"\t\t<date> "+article.attributes["date"].to_s+" </date>\n"+
		"\t\t<doc-type> "+article.attributes["document_type"].to_s+" </doc-type>\n"+
		"\t\t<section-name> "+article.attributes["section_name"].to_s+" </section-name>\n"+
		"\t</article>\n"
	end

end


