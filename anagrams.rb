# require 'byebug'# n! * n!
# O(n!) memory
require 'benchmark'

$a = 'aasl;dkjfasl;dkjf'
$b = $a.split('').reverse.join("")



def anagram?(word1, word2)

  word1 = word1.split("").permutation
  word1.include?(word2.split(""))
end


def anagram2?(word1, word2)
  # debugger
  word1 = word1.split("")
  word2 = word2.split("")
  word1.each_index do |idx1|
    word2.each_index do |idx2|
      if word1[idx1] == word2[idx2]
        word2.delete_at(idx2)
      end
    end
  end
  word2.empty?
end

def anagram3?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def anagram4?(word1, word2)
  letter_hashize(word1) == letter_hashize(word2)
end

def letter_hashize(word)
  hsh = Hash.new(0)
  word.each_char do |ch|
    hsh[ch] += 1
  end
  hsh
end
iterations = 10
Benchmark.bm do |bm|
 bm.report('anagram2') { iterations.times {anagram2?($a, $b)} }
 bm.report('anagram3') { iterations.times {anagram3?($a, $b)} }
 bm.report('anagram4') { iterations.times {anagram4?($a, $b)} }
 # bm.report('anagram1') { iterations.times {anagram?($b, $a)} }
end
