require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


LANGUAGE = 'en'
# ask the user for two numbers
# ask the user for an operation
# perform the operation on thw two numbers
# output the result
# answer = Kernel.gets()
# Kernel.puts(answer)

def messages(message,lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  # it has a valid numerical representation
  integer?(input) || float?(input)
end

def operator_to_message(op)
  word = case op
          when "1"
            "Adding"
          when "2"
            "Subtracting"
          when "3"
            "Multiplying"
          when "4"
            "Dividing"
        end

  x = "a random of line of code"


  word
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure you use a valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmm. that doesnt look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm. that doesnt look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like perform?
      1)add
      2)subtract
      3)multiply
      4)divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = Kernel.gets.chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operator_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again) ")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator.")
