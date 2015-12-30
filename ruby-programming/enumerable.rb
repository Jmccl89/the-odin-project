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

	end

	def my_any?

	end
end
