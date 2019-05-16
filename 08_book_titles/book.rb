def titleize(text)
  small_words = %w[an a aboard about above across after against along amid among and anti around as at before behind below beneath beside besides between beyond but by concerning considering despite down during except excepting excluding following for from in inside into like minus near of off on onto opposite outside over past per plus regarding round save since than the through to toward towards under underneath unlike until up upon versus via with within without ]
  text.split.map(&:capitalize).join(' ')
  words = text.split
  words.each_with_index do |x, index|
    x.capitalize! if index.zero? || small_words.include?(x) == false
  end
  words.join(' ')
end

class Book
  def title=(title)
    @title = titleize(title)
  end
  def title
    @title
  end
end