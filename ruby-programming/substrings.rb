def substrings(word, dictionary)
  results = {}
  dictionary.each do |x|
    if word.include? x
      x = x.downcase
      results.key?(x) ? results[x] += 1 : results[x] = 1
    end
  end
  results
end
