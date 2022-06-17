def my_min(nums) # time = O(n^2)
    nums.each_with_index do |num_1, index_1|
        smaller = false
        nums.each_with_index do |num_2, index_2|
            if index_1 != index_2 
                smaller = true if num_2 < num_1
            end
        end
        return num_1 if !smaller
    end
end

def my_min_two(nums) # time = O(n)
    min = nums.first
    nums.each { |num| min = num if num < min }
    min
end

def my_min_three(nums) # time = O(n)
    nums.inject { |acc, ele|  acc > ele ? acc = ele : acc } 
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# p my_min_two(list)  # =>  -5

# p my_min_three(list)  # =>  -5

# Write a function that iterates through the array and finds 
# all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. 
# Then find the sums of each sub-array and return the max.


# Discuss the time complexity of this solution.

def largest_contiguous_subsum(nums) # time = O(n^2)
    subsets = []
    (0...nums.length).each do |i|
        (0...nums.length).each do |j|
            subsets << nums[i..j] if i <= j
        end
    end
    subsetsums =[]
    subsets.each do |ele|
        subsetsums << ele.sum
    end
    subsetsums.max
end

def largest_contiguous_subsum_two(nums) # time = O(n)
    
end

# Let's make a better version. 
# Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum. To accomplish this 
# efficient space complexity, consider using two variables. 
# One variable should track the largest sum so far and another 
# to track the current sum. We'll leave the rest to you.

def largest_contiguous_subsum_three(nums) # time = O(n)
    largest_sum = 0
    current_sum = 0
    nums.each do |num|
        current_sum += num
        current_sum > largest_sum ? largest_sum = current_sum : largest_sum
    end
    largest_sum
end

list = [5, 3, -7]

list_2 = [2, 3, -6, 7, -6, 7]

list_3 = [-5, -1, -3]
    largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum(list) # => 8
p largest_contiguous_subsum_two(list) # => 8
p largest_contiguous_subsum_three(list)

p largest_contiguous_subsum(list_2) # => 8
p largest_contiguous_subsum_two(list_2) # => 8
p largest_contiguous_subsum_three(list_2)

p largest_contiguous_subsum(list_3) # => -1
p largest_contiguous_subsum_two(list_3) # => -1
p largest_contiguous_subsum_three(list_3)# => -1
   

# possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7