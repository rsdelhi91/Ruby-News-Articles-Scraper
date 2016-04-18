# This class overrides the Article class in the News folder and specifies keys for articles
# scraped from the JSON source for the New York Times. When the scrape method in the NYTImporter 
# is called, all the relevant data is stored in this hash for later use in formatting. If any
# attributes need to be added in the future we can include them by adding them here.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

class NYTArticle < News::Article

    attr_reader :document_type, :section_name

    # Initialize the news article, using named parameters to associate
    # the title, summary, source, date, document_type, and section_name.
    # The author and images attribute is used here to call the superclass
    # and perform subclassing.
    def initialize author:, title:, summary:, images:, source:, date:, document_type:, section_name:
      super author: author, title: title, summary: summary, images: images, source: source, date: date
      @document_type = document_type
      @section_name = section_name
    end

    # Returns all of the attributes of an article as a hash. The author and
    # images key is removed from the hash because the source chosen does not
    # have any authors or images in its data.
    def attributes
      hash = super
      hash.delete('author')
      hash.delete('images')
      hash["document_type"] = document_type
      hash["section_name"] = section_name
      hash
    end

end