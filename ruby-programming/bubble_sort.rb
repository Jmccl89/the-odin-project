def bubble_sort(list)
	counter = list.length-1
	while counter > 1 do
		pre_sort = list.dup
		for i in 0..counter-1
				if list[i] > list[i+1]
					list[i], list[i+1] = list[i+1], list[i]
				end
		end
		if list == pre_sort
			counter = 0
		end
		counter -= 1
	end
	return list
end

def bubble_sort_by(list)
	counter = list.length-1
	while counter > 1 do
		pre_sort = list.dup
		for i in 0..counter-1
				if yield(list[i], list[i+1]) > 0
					list[i], list[i+1] = list[i+1], list[i]
				end
		end
		if list == pre_sort
			counter = 0
		end
		counter -= 1
	end
	return list
end

#puts bubble_sort([2,4,1,5,6,1])
# => [1,1,2,4,5,6]
#puts bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}
# => ["hi","hey","hello"]