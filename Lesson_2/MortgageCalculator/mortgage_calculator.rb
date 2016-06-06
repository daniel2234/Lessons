require 'pry'

def prompt(message)
	Kernel.puts("=> #{message}")
end


prompt(" Welcome to your own Mortgage Calculator. Enter your name.")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure you use a valid name")
  else
    break
  end
end

prompt("Hello #{name}. We will calculate your loan duration in months based on your monthly rate.")

#main loop
loop do
	loan_amount = ''
	loop do
		prompt("What is your loan amount?")
		loan_amount = Kernel.gets().chomp()
		if loan_amount.empty?() || loan_amount.to_f() < 0
			prompt("Please enter a valid amount.")
		else
			break
		end
	end

	interest_rate = ''
	loop do
		prompt("What is your interest rate?")
		interest_rate = Kernel.gets().chomp()
		if interest_rate.empty?() || interest_rate.to_f() < 0
			prompt("Please enter a valid amount.")
		else
			break
		end
	end

	loan_duration = ''
	loop do
		prompt("What is your loan duration (years)?")
		loan_duration = Kernel.gets().chomp()
		if loan_duration.empty?()|| loan_duration.to_i < 0
			prompt("Please enter a valid amount.")
		else
			break
		end
	end

	annual_interest_rate = interest_rate.to_f() / 100
	monthly_interest_rate = annual_interest_rate / 12
	months = loan_duration.to_i() * 12 

	monthly_payment  = loan_amount.to_f() * 
										 (monthly_interest_rate / 
										 	(1 - (1 + monthly_interest_rate)** - months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
	prompt("Do you want to perform another calculation? (Y to calculate again) ")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you #{name} for using the Mortgage Calculator!")
