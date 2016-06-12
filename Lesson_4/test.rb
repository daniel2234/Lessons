# reverse a string in ruby without reverse

def reverse_string(string)
    new_array = []
    split_string = string.split('')
    split_string.count.times do
      new_array << split_string.pop
    end
    new_array.join('')
end

p reverse_string("hello")
# Factorialize a Number 
# Return the factorial of the provided integer.
# If the integer is represented with the letter n,
# a factorial is the product of all positive integers less than or equal to n.
# Factorials are often represented with the shorthand notation n!
# For example: 5! = 1 * 2 * 3 * 4 * 5 = 120

# function factorialize(num) {
#   return num;
# }
# factorialize(5);

def factorialize(num)
  num_array = []
  index = num
  index.downto(1) do |i|
    num_array << i
  end
  if num_array.inject(:*) == nil
    return 1
  else
    return num_array.inject(:*)
  end
end

p factorialize(5)
p factorialize(0)

# Check for Palindromes 
# Return true if the given string is a palindrome. 
# Otherwise, return false.

# A palindrome is a word or 
# sentence that's spelled the same way both forward and backward, 
# ignoring punctuation, case, and spacing.

# Note
# You'll need to remove all non-alphanumeric characters 
# (punctuation, spaces and symbols) and turn everything lower case in order to check 
# for palindromes.

# We'll pass strings with varying formats, such as "racecar", 
# "RaceCar", and "race CAR" among others.

def palindrome(string)
  modified_string = string.split('')
  modified_string.delete_if { |element| element == " " }
  modified_string.each { |chr| chr.downcase!}
  if modified_string == modified_string.reverse
    true
  else
    false
  end
end

p palindrome("racecar")
p palindrome("Race car")
p palindrome("racecar")
p palindrome("race car")
p palindrome("race CAR")


p palindrome("boxcar")


# Find the Longest Word in a String 
def find_longest_word(string)
  string_split = string.split(' ')
  string_split.max_by { |a| a.length }
end
p find_longest_word("The quick brown fox jumped over the lazy dog")









