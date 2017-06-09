def naive_max_windowed_range(arr, w)
  idx = 0
  max_range = 0
  while idx + w <= arr.length
    current_window = arr[idx...idx + w]
    current_range = current_window.max - current_window.min
    max_range = current_range if current_range > max_range
    idx += 1
  end

  max_range
end

def optimized_max_window(arr, w)
  current_window = 

end

p naive_max_windowed_range([1, 2, 3, 5], 3)
