# #Question 1

# # Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

# # For this exercise, write a one-line program that creates the following output 10 times,
# #  with the subsequent line indented 1 space to the right:

# # The Flintstones Rock!
# #  The Flintstones Rock!
# #   The Flintstones Rock!

# # 10.times { |n| puts (" " * n) + "The Flintstones Rock !"}

# #Question 2
# # Create a hash that expresses the frequency with which each letter occurs in this string:

# statement = "The Flintstones Rock"

# result = {}
# # puts ('A'..'Z').to_a
# # puts ('a'..'z').to_a
# # puts ('A'..'Z').to_a + ('a'..'z').to_a
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# # letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
# 	letter_frequency = statement.scan(letter).count
# 	result[letter] = letter_frequency if letter_frequency > 0
# end
# # letters.each do |letter|
# # 	puts letter_frequency = statement.scan(letter).count

# # end


# #Question 3

# # The result of the following statement will be an error

# puts "the value of 40 + 2 is #{40 + 2}"
# puts "The value of 40 + 2 is " + (40 + 2).to_s

# #Why is this and what are are two possible ways to fix this?

# #Question 4
# #Why happens when we modify an array while we iterating over it? what would be the output by this code?

# # numbers = [1, 2, 3, 4]
# # numbers.each do |number|
# # 	puts number
# # 	numbers.shift(1)
# # end
# #prints [1, 3]

# #What would be an output by this code?
# numbers = [1, 2, 3, 4]
# puts numbers
# numbers.each do |number|
# 	p number
# 	numbers.pop(1)
# end	
#prints 1,2

# puts times_3(gets.to_i)

# BEGIN {
# 	def times(n)
# 		n * 3
# 	end
# }

# Question 5

# Alan wrote the following method, which was intended to show all of the factors of the input number:
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  puts divisors
end

# Alyssa noticed that this will fail if you call this with an input of 0 or a negative number and 
# asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until)
#  to make this work? Note that we're not looking to find the factors for 0 or negative numbers, 
#  but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 
  	divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  puts divisors
end

# Bonus 1

# What is the purpose of the number % dividend == 0 ?
# This is to check if the user input a number that does not have a modulo

# Bonus 2
# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
#returns a value



# Question 6

# Alyssa was asked to write an implementation of a rolling buffer. 
# Elements are added to the rolling buffer and if the buffer becomes full,
#  then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". 
# Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# Yes, there is a difference. While both methods have the same return value,
# in the first implementation, 
# the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns. 
# That is, the caller will have the input array that they pass in be different once the call returns. 
# In the other implementation, rolling_buffer2 will not alter the caller's input argument.

#Question 7

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, 
# and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. 
# Something about the limit variable. What's wrong with the code?



# def fib(first_num, second_num)
#   limit = 15
#   while second_num <= limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# How would you fix this so that it works?
#limit variable is out of scope.

# Question 8

# In another example we used some built-in string methods to change the case of a string.
#  A notably missing method is something provided in Rails, but not in Ruby itself...titleize! 
#  This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.

def titleize(x)
	#this splits it into and array
	words = x.split
	#this takes the array and and iterates through each word
	words.each do |word|
		#if the word length is less than 3 make it smaller
        if word.length < 3
            word.downcase!
        elsif word.length > 3
        	#if the word length is less than 3 make it bigger
            word.capitalize!
        end
    end
    #then join the words to make a string
    words.join(' ')
    puts words
end

titleize("title")

#Question 9
# Modify the hash such that each member of the Munster family has an additional "age_group" key 
# that has one of three values describing the age group the family member is in (kid, adult, or senior). 
# Your solution should produce the hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, values|
	case values["age"]
	when 0...18
		values["age_group"] = "kid"
	when 18...64
		values["age_group"] = "adult"
	else
		values["age_group"] = "senior"
	end
end
puts munsters