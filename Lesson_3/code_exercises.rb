# write a method that will generate random english words math problems. The method should take a length, then return a math phrase with that many operations.

#example:

#mathphrase(1) => "five minus two"
#mathphrase(2) => "two plus three times eight"
#mathphrase(3) => "one divided by three plus five times zero"

#Given:
# NUMBERS = %(zero one two three four five six seven eight nine ten)
# OPERATORS = %(plus minus times divided)

 # reverse a string without using the String #reverse
# def string_reverse(string)
# 	new_array = []

#     split_array = string.split("")

#     string.length.times do
#     	new_array << split_array.pop
#     end
#     new_array.join("")
# end

# p string_reverse("String")


def fizz_buzz(firstnum, secondnum)
fizz_buzz_array = []
	(firstnum..secondnum).each do |element| 
		if element % 3 == 0 && element % 5 == 0
			fizz_buzz_array << "FizzBuzz"
		elsif element % 3 == 0
			fizz_buzz_array << "Fizz"
		elsif element % 5 == 0
			fizz_buzz_array << "Buzz"
		else
			fizz_buzz_array << element
		end
	end
	puts fizz_buzz_array.join(", ")
	# begin
	# 	if firstnum % 3 == 0
	# 		puts "Fizz"
	# 	elsif firstnum % 5 == 0
	# 		puts "Buzz"
	# 	elsif firstnum % 5 == 0 && firstnum % 3 == 0
	# 		puts "FizzBuzz"
	# 	else
	# 		puts firstnum
	# 	end
	# 	firstnum += 1
	# end while firstnum <= secondnum
end

# fizz_buzz(1, 15)




PRODUCTS = 	[
{name: "Thinkpad x210", price: 220}, 
{name: "Thinkpad x220", price: 250}, 
{name: "Thinkpad x250", price: 979}, 
{name: "Thinkpad x230", price: 300}, 
{name: "Thinkpad x230", price: 330}, 
{name: "Thinkpad x230", price: 350}, 
{name: "Thinkpad x240", price: 700}, 
{name: "Macbook Leopard", price: 300}, 
{name: "Macbook Air", price: 700}, 
{name: "Macbook Pro", price: 600}, 
{name: "Macbook", price: 1449}, 
{name: "Dell Latitude", price: 200},
{name: "Dell Latitude", price: 650},
{name: "Dell Inspiron", price: 300},
{name: "Dell Inspiron", price: 450}
]

query = {
	price_min: 240,
	price_max: 280,
	q:"thinkpad"
}

query2 = {
	price_min: 300,
	price_max: 450,
	q:"dell"
}

#(price_min..price_max).include?(price)

#1 print out something
#2 print out the products
#3 print out each el in the products
#4 print out el that are less than 350 in price
#5 start to incoporate the query criteria, only max price


def search(query)
  PRODUCTS.each do |element| 
      if element[:price] <= query[:price_max] && element[:price] >= query[:price_min] && element[:name].downcase.include?(query[:q])
        puts element
      end
  end
end



# def search(query)
# 	PRODUCTS.select do |element| 
# 		(query[:price_min]..query[:price_max]).include?(element[:price]) &&
# 		element[:name].downcase.include?(query[:q])
# 	end
# end

# search(query)
#[{name: "Thinkpad x220", price: 250}

# search(query2)
#[{name: "Dell Inspirion", price: 300}, {name: "Dell Inspirion", price: 450}]




#Write an array that takes an array of strings, and returns an array of the same string values, except with the vowels allowed

#Write a lit of words: green, yellow, black, white

#List of modified words are : grn, yllw, bck, wht


# def subtract_vowel(arr)
#   new_array = arr.map do |element|
#      element.delete "aeiou"
#   end
#   p new_array.join(" ")
# end


# subtract_vowel(["green", "yellow", "black", "white"])


#Write a method that takes a string, and returns a boolean indicating whether the string has balanced set of parentheses

# def balancer(string)
#   return false unless string.count("(") == string.count(")")
#   #detect if order is good here
#   paren_count = 0

#   string.split("").each do |char|
#     paren_count += 1 if char == "("
#     paren_count -= 1 if char == ")"

#     return false if paren_count < 0
#   end
#   true
# end


# p balancer("hi")
# p balancer("(hi")
# p balancer("(hi)")
# p balancer(")hi(")

#write a method that takes two numbers. It should print out all primes between the two numbers, dont use ruby's prime class

def is_prime?(number)
  (2..(number - 1)).each do |divisor|
    return false if number % divisor == 0
  end
  true
end


def find_primes(firstnum, secondnum)
    (firstnum..secondnum).select do |number|  
      is_prime?(number)
    end
end

#  1, 2, 3, 4, 5, 6
#2, 3, and 5 are the prime numbers

p find_primes(1, 6)
# find_primes(3, 10)






















