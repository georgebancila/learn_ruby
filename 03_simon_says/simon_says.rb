def echo(word)
  word
end

def shout(words)
  return words.upcase!
end

def repeat(word, times = 2)
  res = ""
  times.times{ res += word + " "}
  res.chop!
end

def start_of_word(word, no_of_chars = 1)
  word[0,no_of_chars]
end

def first_word(text)
  text.split.first
end

def titleize(text)
  small_words = %w[aboard about above across after against along amid among and anti around as at before behind below beneath beside besides between beyond but by concerning considering despite down during except excepting excluding following for from in inside into like minus near of off on onto opposite outside over past per plus regarding round save since than the through to toward towards under underneath unlike until up upon versus via with within without ]
  text.split.map(&:capitalize).join(' ')
  words = text.split
  words.each_with_index do |x, index|
    x.capitalize! if index.zero? || small_words.include?(x) == false
  end
  words.join(' ')
end