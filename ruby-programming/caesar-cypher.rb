# Shift each alpha character by specified value maintaining case and 
# ensuring Z-A and z-a rollover. Do not shift any non-alpha characters.
#
#    caesar_cypher("Test.", 4)              => "Xiwx."
#    caesar_cypher("Test.", 10)             => "Docd."
#    caesar_cypher("Test.", -10)            => "Juij."
#    caesar_cypher("Sentence, test!", 5)    => "Xjsyjshj, yjxy!"

def caesar_cypher(string, shift)
    new_string = ""
    string.split("").each do |x| 
        if (65..90) === x.ord
            y = x.ord + shift
            y -= 26 while y > 90
            y += 26 while y < 65
        elsif (97..122) === x.ord
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

puts caesar_cypher("Test.", 4)
puts caesar_cypher("Test.", 10)
puts caesar_cypher("Test.", -10)
puts caesar_cypher("Sentence, test!", 5)