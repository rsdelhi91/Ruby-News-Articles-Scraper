# This class provides a format for the Articles to be stored in, by specifying keys
# relating to data scraped from the RSS feed for the Herald Sun. When the scrape method
# in the HSImporter is called, all the relevant data is stored in this hash for later
# use in formatting. This class overrides the Article subclass in the News folder so 
# it has all the attributes in the superclass, plus, we can add further attributes as
# they become available by adding them here. This grants us a more flexible design
# as we can easily add more attributes without any significant changes.
#
# Author::  Rahul Sharma (Student No: 706453, student ID: sharma1)
#

class HSArticle < News::Article

    # Initialize the Attributes in the superclass with the help of super.
    def initialize author:, title:, summary:, images:, source:, date:
      super author: author, title: title, summary: summary, images: images, source: source, date: date
    end

    # Returns all of the attributes of an article as a hash. Since we do not
    # have authors in the articles being scraped, we have removed them from
    # the hash.
    def attributes
      hash = super
      hash.delete('author')
      hash
    end

end