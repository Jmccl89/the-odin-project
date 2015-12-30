module Enumerable
	def my_each
		return self.to_enum if !block_given?
		for i in self
			yield i
		end
	end

	def my_each_with_index
		return self.to_enum if !block_given?
		index = 0
		for i in self
			yield i, index
			index += 1
		end
	end

	def my_select
		return self.to_enum if !block_given?
		result = []
		for i in self
			result << i if yield i
		end
		return result
	end

	def my_all?
		state = true
		self.my_each do |item|
			if (block_given? && !yield(item)) || (!block_given? && !item)
				state = false
				break
			end
		end
		return state
	end

	def my_any?
		state = false
		self.my_each do |item|
			if (block_given? && yield(item)) || (!block_given? && item)
				state = true
				break
			end
		end
		return state
	end

	def my_none?
		state = false
			self.my_each do |item|
				if (block_given? && !yield(item)) || (!block_given? && !item)
					state = true
				else
					state = false
					break
				end
			end
		return state
	end
end