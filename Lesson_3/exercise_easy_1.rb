# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Question 2

# Describe the difference between ! and ? in Ruby. 
# And explain what would happen in the following scenarios:
# 1. what is != and where should you use it? 
# 2. put ! before something, like !user_name
# 3. put ! after something, like words.uniq! 
# 4. put ? before something 
# 5. put ? after something 
# 6. put !! before something, like !!user_name

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub! 'important', 'urgent'
puts advice

# Question 4 The Ruby Array class has several methods for removing items from the array.
 # Two of them have very similar names. Let's see how they differ:

 numbers = [1,2,3,4,5]
 # What does the follow method calls do (assume we reset numbers to the original array between method calls)?

 puts numbers.delete_at(1)
 puts numbers.delete(1)

# Question 5 Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.

(10..100).cover?(42)

# Question 6
# Starting with the string:
famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

"Four score and " + famous_words
famous_words.prepend("Four score and ")
"Four score and " << famous_words

# Question 7
# Fun with gsub:

def add_eight(number)
	number + 8 
end

number = 2

how_deep = "number"
5.times {how_deep.gsub!("number","add_eight(number)")}

p how_deep

puts eval(how_deep)

# Question 8
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.

flintstones.flatten!


# Question 9
# Given the hash below
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones.assoc("Barney")
# => ["Barney", 2]



#Question 10
# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones_hash = {}
flintstones_hash.each_with_index do |name, index|
	flintstones_hash[name] = index
















