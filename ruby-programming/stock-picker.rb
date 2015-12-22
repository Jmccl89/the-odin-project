def stock_picker(prices)
    best_pair = []
    best_diff = 0
    last = prices.length - 1
    for i in 0..last
        for j in i + 1..last
            new_diff = prices[j] - prices[i]
            if new_diff > best_diff
                best_diff = new_diff
                best_pair = [i,j]
            end
        end
    end
    puts "The best day to buy is day #{best_pair[0]} at $#{prices[best_pair[0]]}."
    puts "The best day to sell is day #{best_pair[1]} at $#{prices[best_pair[1]]}."
    puts "The profit per share will be $#{prices[best_pair[1]] - prices[best_pair[0]]}."
end

stock_picker([17,3,6,14,13,5,2,6,18])