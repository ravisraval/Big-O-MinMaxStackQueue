require_relative 'stacks_and_queue'
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
# require 'byebug'
def optimized_max_window(arr, w)
  # debugger
  queue = MinMaxStackQueue.new
  w.times {|i| queue.enqueue(arr[i])}
  max_range = queue.max - queue.min

  idx = w
  while idx < arr.length
    queue.dequeue
    queue.enqueue(arr[idx])
    current_range = queue.max - queue.min
    max_range = current_range if current_range > max_range

    idx += 1
  end
  max_range
end

p optimized_max_window([1, 2, 3, 5], 3)
