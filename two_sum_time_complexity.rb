require 'benchmark'

def brute_force_sum?(arr, target_sum)
  arr.each_index do |idx|
    arr.each_index do |idx2|
      next if idx >= idx2
      return true if arr[idx] + arr[idx2] == target_sum
    end
  end
  false
end

def okay_two_sum_a?(arr, target_sum)
  arr = arr.sort
  i, j = 0, arr.length - 1

  while i < j
    case (arr[i] + arr[j]) <=> target_sum
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
  end

  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort!
  arr.each_with_index do |num, idx|
    duped = arr.dup
    duped.delete_at(idx)
    return true if duped.bsearch {|x| x == (target_sum - num)}
  end
  false
end

def hash_map_sum?(arr, target_sum)
  hash = Hash.new(0)

  arr.each do |num|
    hash[num] += 1
  end

  hash.keys.each do |num|
    return true if num * 2 == target_sum && hash[num] > 1
    dupped_keys = hash.keys
    dupped_keys -= [num]
    return true if dupped_keys.include?(target_sum - num)
  end

  false
end

def two_sumh?(arr, target_sum)
  complements = {}

  arr.each do |el|
    return true if complements[target_sum - el]
    complements[el] = true
  end

  false
end

$arr = (0..900000000).to_a
$target_sum = 800000004
iterations = 1
Benchmark.bm do |bm|
  bm.report('brute_force_sum') { iterations.times { brute_force_sum?($arr, $target_sum) } }
  bm.report('okay_two_sum') { iterations.times { okay_two_sum_a?($arr, $target_sum) } }
  # bm.report('hash_map_sum') { iterations.times { hash_map_sum?($arr, $target_sum) } }
  bm.report('two_sumh') { iterations.times { two_sumh?($arr, $target_sum) } }
end
