require "byebug" 

# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

def bad_two_sum?(arr, target_sum)  # O(n^2)
    arr.each_with_index do |ele, i|
        arr.each_with_index do |ele2, j|
            return true  if ele + ele2  == target_sum && j > i
        end
    end
    false
end

arr = [1, 5, 0, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# def okay_two_sum?(arr, target_sum)
#     arr = arr.sort #0(nlogn)
#     last =  arr.length - 1
#     until arr.empty? || 1 == last
#         (last).downto(0) do |i|
#             case arr[0] + arr[i] <=> target_sum
#             when -1
#                 # p arr
#                 # p arr[first]
#                 # p arr[i]
#                 # p  arr[first] + arr[i]
#                 # p "_____case -1___BEFORE_____________________________"
#                 arr.shift
#                 last = arr.length - 1
#                 break
#             when 0
#                 # p arr
#                 #  p arr[first]
#                 # p arr[i]
#                 # p  arr[first] + arr[i]
#                 # p "_____case 0________________________________"
#                 return true
#             when 1
#                 #  p arr[first]
#                 # p arr[i]
#                 # p  arr[first] + arr[i]
#                 # p "_______case _1_____________________________"
#                 arr.pop
#            end
#         end
#     end
#     false
# end

# arr = [1, 5, 0, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => false


def okay_two_sum?(arr, target)  # O(n log(n))
    arr = arr.sort
    arr.each_with_index do |ele, idx|
        new_target = target - ele
        if new_target == ele
            if new_target != arr[idx + 1]
                break
            end
        end
        return true if bsearch(arr, new_target)
    end
    false
end

def bsearch(arr, target)
    return false if arr.length < 2
    mid = arr.length/2
    middle = arr[mid]
    left = arr.take(mid)
    right = arr.drop(mid + 1)

    case middle <=> target
    when -1
        bsearch(left, target)
    when 0
        puts middle
        return true
    when 1
        bsearch(right, target)
    end
    false
end

arr = [1, 5, 0, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => false

# arr1 = [1, 5, 5, 0, 7]
# p okay_two_sum?(arr1, 6) # => should be true
# p okay_two_sum?(arr1, 10) # => true

def linear_two_sum?(arr, target)
    hash = Hash.new() { |h,k| h[k] = [] }
    arr.each_with_index { |ele, idx| hash[ele] << idx }
    hash.keys.each do |key|
        diff = target - key
        if diff == key
            return true if hash[diff].length >1
        else
            return true if hash.has_key?(diff) 
        end
    end
    false

   

end

arr = [1, 5, 0, 7]
 p linear_two_sum?(arr, 6) # => should be true
 p linear_two_sum?(arr, 10) # => false

 arr1 = [1, 5, 5, 0, 7]
 p linear_two_sum?(arr1, 6) # => should be true
p linear_two_sum?(arr1, 10) # => true

