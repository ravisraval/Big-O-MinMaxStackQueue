def my_min(arr)
  min = nil
  arr.each_index do |idx|
    dupped_arr = arr.dup
    dupped_arr.delete_at(idx)
    min = arr[idx] if dupped_arr.all? { |el| arr[idx] < el }
  end
  min
end
#n*n

def my_other_min(arr)
  min = arr[0]
  arr.each do |el|
    if el < min
      min = el
    end
  end
  min
end
#n

def largest_sub_sum(arr)
  subs = []
  arr.each_index do |idx|
    arr.each_index do |jdx|
      next if idx > jdx
      subs << arr[idx..jdx]
    end
  end
  subs.map { |sub_arr| sub_arr.reduce(:+)}.max

end

#n ** 3
require 'byebug'
def largest_contiguous_subsum2(arr)
  debugger
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 } #if all nums are negative, just return the max

  arr.drop(1).each do |num| #there must be at least one positive || 0
    current = 0 if current < 0 #if i've added nums and current < 0,
    current += num
    largest = current if current > largest
  end

  largest
end

#O(n)
