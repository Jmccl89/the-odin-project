def bubble_sort(list)
	counter = list.length-1
	iterations = 0
	while counter > 1 do
		pre_sort = list.dup
		for i in 0..counter-1
				first = list[i]
				second = list[i+1]
				if first > second
					list[i] = second
					list[i+1] = first
				end
				iterations += 1
		end
		if list.inspect == pre_sort.inspect
			counter = 0
		end
		counter -= 1
	end
	puts "Elements: #{list.length}"
	puts "Iterations: #{iterations}"
	return list
end

puts bubble_sort([2,4,1,5,6,1])