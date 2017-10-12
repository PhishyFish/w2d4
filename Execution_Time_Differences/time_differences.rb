require "byebug"

def testn(n, str)
  puts "\033[0;32m"
  puts "************"
  puts "test no: #{n} #{str}"
  puts "************"
  puts "\033[0m"
end

# Execution Time Difference
#
# Learning Goals
#
# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved
# my_min
#
# Given a list of integers find the smallest number in the list.
#
# Example:
#
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5

#
# Phase I
#
# First, write a function that compares each element to every other
 # element of the list. Return the element if all other elements in the
 # array are larger.
# What is the time complexity for this function?
#
list2 = [0, -5, 3]
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
def my_min(array)
#   smallest = true
#   temp = array[0]
#
#   array.each_with_index do |el, idx|
#       debugger
#     array.each_with_index do |el2, idx2|
#       next if idx == idx2
#       if el2 < el
#         smallest = false
#         temp = el2
#         break
#       else
#         smallest = true
#       end
#     end
#     return temp if smallest
#   end
# end

  i, j = 0
  temp = nil
  while i < array.length
    j = 0
      while j < array.length && j != i
        if array[j] < array[i] && array[j] < temp.to_i
          temp = array[j]
        end
        j += 1
      end
    i +=1
  end
  temp
end

testn(1, "my_min")
p my_min(list)




# Phase II
#
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
#

def my_min2(arr)
  temp = arr.first
  arr.each { |el| temp = el if el < temp }

  temp
end

testn(2, "my_min2")
p my_min2(list)

# Largest Contiguous Sub-sum
#
# You have an array of integers and you want to find the largest contiguous
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.
#
# Example:
#
#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:
#
#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:
#
#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
#
# Write a function that iterates through the array and finds all sub-arrays
# using nested loops. First make an array to hold all sub-arrays. Then find
# the sums of each sub-array and return the max.
#
# Discuss the time complexity of this solution.

def largest_contiguous_subsum(arr)
  subarrays = []
  arr.each_index do |idx|
    subarr = []
    arr[idx..-1].each do |el|
      subarr << el
      subarrays << subarr.reduce(:+)
    end
  end

  subarrays.max
end

list3 = [2, 3, -6, 7, -6, 7]
list4 = [-5, -1, -3]

testn(3, "largest_contiguous_subsum")
p largest_contiguous_subsum(list3)
p largest_contiguous_subsum(list4)

# Phase II
#
# Let's make a better version. Write a new function using O(n) time with
# O(1) memory. Keep a running tally of the largest sum.
#
# Get your story straight, and then explain your solution's time
# complexity to your TA.

def largest_contiguous_subsum2(arr)
  largest_sum = arr.first
  acc = 0
  arr.each do |el|
    if acc.nil?
      acc = el
    elsif acc + el < 0
      acc = nil
    else
      acc += el
    end

    largest_sum = acc if !acc.nil? && acc > largest_sum
  end
  largest_sum
end

testn(4, "largest_contiguous_subsum2")
p largest_contiguous_subsum2(list3)
p largest_contiguous_subsum2(list4)
