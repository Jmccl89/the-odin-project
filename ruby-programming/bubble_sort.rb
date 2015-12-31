def bubble_sort(arr)
  counter = arr.length - 2
  while counter > 1
    pre_sort = arr.dup
    for i in 0..counter
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
    end
    break if arr == pre_sort
    counter -= 1
  end
  arr
end

def bubble_sort_by(arr)
  counter = arr.length - 1
  while counter > 1
    pre_sort = arr.dup
    for i in 0..counter - 1
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if yield(arr[i], arr[i + 1]) > 0
    end
    break if arr == pre_sort
    counter -= 1
  end
  arr
end
