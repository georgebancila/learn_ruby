require 'humanize'

class Integer
  def in_words
    humanize.gsub('-', ' ').gsub(' and ', ' ').gsub(',', '')
  end
end
