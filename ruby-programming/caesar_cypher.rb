def caesar_cypher(string, shift)
  new_string = ''
  string.split('').each do |x|
    if (65..90).include? x.ord
      y = x.ord + shift
      y -= 26 while y > 90
      y += 26 while y < 65
    elsif (97..122).include? x.ord
      y = x.ord + shift
      y -= 26 while y > 122
      y += 26 while y < 97
    else
      y = x.ord
    end
    new_string << y.chr
  end
  new_string
end
