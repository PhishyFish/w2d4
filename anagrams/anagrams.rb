# Anagrams
#
# Our goal today is to write a method that determines if two given words
# are anagrams. This means that the letters in one word can be rearranged
# to form the other word. For example:
#
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.
#
# Learning Goals
#
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime

# Phase I:
#
# Write a method #first_anagram? that will generate and store all the
# possible anagrams of the first string. Check if the second string is one of these.
#

str1 = "actd"
str2 = "cat"
# def first_anagram?(str1, str2)
#
# end
#
# def perms(str1)
#   a = str1.chars
#   return [a] if a.size <= 1
#   m = a.map do |el|
#     a.length.times do |idx|
#     [el] +=
#     end
#   end
#   m
# end
# Hints:
#
# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?
#
# Phase II:
#
# Write a method #second_anagram? that iterates over both strings. As
# you find letters that appear in both words, delete them one at a time.
# They are anagrams if both the strings are empty at the end.
#
# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

def second_anagram?(str1, str2)
  str1_chars = str1.chars
  str2_chars = str2.chars

  str1.chars.each do |ch1|
    str1_chars.delete_if { str2.include?(ch1) }
  end

  str2.chars.each do |ch1|
    str2_chars.delete_if { str1.include?(ch1) }
  end

  str1_chars == str2_chars
end

p second_anagram?(str1, str2)
# Phase III:
#
# Write a method #third_anagram? that solves the problem by sorting both strings
# alphabetically. The strings are then anagrams if and only if the sorted versions
# are the identical.
#
# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str1, str2)
  s1 = str1.split('').sort
  s2 = str2.split('').sort

  s1 == s2
end

# Phase IV:
#
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.
#
# What is the time complexity?
#
# Bonus: Do it with only one hash.
#
# Discuss the time complexity of your solutions together, then call over your TA to look at them.
