def stock_picker(prices)
  best_pair = []
  best_diff = 0
  prices.each_with_index do |i, i_index|
    prices.each_with_index do |j, j_index|
      if j_index > i_index
        new_diff = j - i
        if new_diff > best_diff
          best_diff = new_diff
          best_pair = [i_index, j_index]
        end
      end
    end
  end
  best_pair
end
