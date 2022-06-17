# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?


def first_anagram(string1, string2) # time = O(n!)
    all_anagrams = string1.split("").permutation.to_a
    all_anagrams.each { |subarr| return true if subarr.join("") == string2} 
    false
end
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

def second_anagram(string1, string2) # time = O(n^2)
    arr1 = string1.split("")
    arr2 = string2.split("")
    arr1.each do |char|
        idx = arr2.find_index(char)
        arr2.delete_at(idx) unless idx.nil?
    end
    return true if arr2.empty?
    false
end


other_string = "acy"
other_other_string = "act"
string = "cat"
# p first_anagram(string, other_string)
# p second_anagram(string, other_string) #false
# p second_anagram(string, other_other_string) #=> true


# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram(string1, string2) # time = O(n log(n))
    arr1 = string1.split("").sort
    arr2 = string2.split("").sort
    return true if arr1 == arr2
    false
end

# p third_anagram(string, other_string) #false
# p third_anagram(string, other_other_string) #=> true

# Write one more method #fourth_anagram?. This time, use two hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.

def fourth_anagram(string, other_string) #time = O(n)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    string.each_char { |char| hash1[char] += 1}
    other_string.each_char { |char| hash2[char] += 1}
    return true if hash1 == hash2
    false
end

# p fourth_anagram(string, other_string) #false
# p fourth_anagram(string, other_other_string) #=> true

def test_anagram
    return true if { 1 => 2, 2 => 3} == { 2 => 3, 1 => 2}
    false
end

# p test

def bonus_anagram(string1, string2)
    hash = Hash.new(0)
    string1.each_char { |char| hash[char] += 1 }
    string2.each_char { |char| hash[char] += -1 }
    hash.all? { |k,v| v.zero? }
end

p bonus_anagram(string, other_string) #false
p bonus_anagram(string, other_other_string) 