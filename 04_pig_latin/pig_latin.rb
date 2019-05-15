VOWELS = %w[a e i o u]
def translate_one(word)
  if VOWELS.include?(word[0])
    "#{word}ay"
  else
    i = 0
    while i < word.length
      if VOWELS.include?(word[i])
        break
      elsif word[i, 2] == 'qu'
        i += 2
        break
      end

      i += 1
    end
    prefix = word[0, i]
    suffix = word[i, word.length - i]
    "#{suffix}#{prefix}ay"
  end
end

def translate(text)
  text.split.map { |word| translate_one(word) }.join(' ')
end