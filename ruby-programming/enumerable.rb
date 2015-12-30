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

	def my_count
		count = 0
		self.my_each do
			count += 1
		end
		return count
	end

	def my_map
		return self.to_enum if !block_given?
		result = []
		self.my_each do |item|
			result << yield(item)
		end
		return result
	end

	def my_map(&proc)
		return self.to_enum if !block_given?
		result = []
		self.my_each do |item|
			result << proc.call(item)
		end
		return result
	end

	def my_inject(initial=0, sym=nil)
		result = initial.nil? ? nil : initial
			if block_given?
				for i in self
					result = yield(result,i)
				end
			else
				if sym.nil?
					sym = initial
					initial = nil
				end
				for i in self
					if initial.nil?
						initial = i
						result = initial
					else
						result = result.send(sym, i)
					end
				end
			end
		return result
	end
end

def multiply_els(elements)
	return elements.my_inject(1) { |result, element| result * element }
end