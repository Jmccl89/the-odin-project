def substrings(word, dictionary)
    results = Hash.new
    dictionary.each do |x|
        if word.include? x
            x = x.downcase
            results.has_key?(x) ? results[x] += 1 : results[x] = 1
        end
    end
    results
end

dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("downhorn", dict)