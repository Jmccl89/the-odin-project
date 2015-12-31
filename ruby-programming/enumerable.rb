module Enumerable
  def my_each
    return to_enum unless block_given?
    for i in self
      yield i
    end
  end

  def my_each_with_index
    return to_enum unless block_given?
    index = 0
    for i in self
      yield i, index
      index += 1
    end
  end

  def my_select
    return to_enum unless block_given?
    result = []
    for i in self
      result << i if yield i
    end
    result
  end

  def my_all?
    state = true
    my_each do |item|
      if (block_given? && !yield(item)) || (!block_given? && !item)
        state = false
        break
      end
    end
    state
  end

  def my_any?
    state = false
    my_each do |item|
      if (block_given? && yield(item)) || (!block_given? && item)
        state = true
        break
      end
    end
    state
  end

  def my_none?
    state = false
    my_each do |item|
      if (block_given? && !yield(item)) || (!block_given? && !item)
        state = true
      else
        state = false
        break
      end
    end
    state
  end

  def my_count
    count = 0
    my_each do
      count += 1
    end
    count
  end

  def my_map(&proc)
    return to_enum unless block_given?
    result = []
    my_each do |item|
      result << proc.call(item)
    end
    result
  end

  def my_inject(initial = 0, sym = nil)
    result = initial.nil? ? nil : initial
    if block_given?
      for i in self
        result = yield(result, i)
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
    result
  end
end

def multiply_els(elements)
  elements.my_inject(1) { |result, element| result * element }
end
