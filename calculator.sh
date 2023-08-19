#!/bin/bash

# power function
# gets two numbers and returns the first number power the second number

check_even_odd() {
    if (( answer % 2 == 0 )); then
        echo "The number is even."
    else
        echo "The number is odd."
    fi
}

is_div_by_5() {
    if (( answer % 5 == 0 )); then
        echo "The number is divisible by 5."
    else
        echo "The number is not divisible by 5."
    fi
}

is_prime_number() {
    if (( answer < 2 )); then
        echo "$answer is not a prime number."
        return 0
    else
        for (( i = 2; i < answer; i++ )); do
            if (( answer % i == 0 )); then
                echo "$answer is not a prime number."
                return 0
            fi
        done
    fi
    echo "$answer is a prime number."
}

power_of() {
    read -p "Enter base number: " first
    read -p "Enter exponent: " second

    if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        answer=$((first ** second))
        echo "The answer is $answer"
    else
        echo "Invalid numbers"
        answer="!"
    fi
}

divide() {

	read -p "enter first number: " first
	read -p "enter second number: " second
	# validation:  ----Inputs are numbers:
	if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
   	then
		if [ $second -eq 0 ]; then
        		echo "Cannot divide by zero."
    		else
        		answer=$(bc <<< "scale=2; $first / $second")
        		echo the answer is $answer
        	fi
	else 
		answer="!"
	fi
	
	
}

multiply() {
	

	read -p "enter first number: " first
	read -p "enter second number: " second
	# validation:  ----Inputs are numbers:
	if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
   	then
        	answer=$(($first * $second))
        	echo the answer is $answer
	else 
		answer="!"
	fi
	
}

add() {
	

	read -p "enter first number: " first
	read -p "enter second number: " second
	# validation:  ----Inputs are numbers:
	if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
   	then
        	answer=$(($first + $second))
        	echo the answer is $answer
	else 
		answer="!"
	fi
	
}

modulus() {
	

	read -p "enter first number: " first
	read -p "enter second number: " second
	# validation:  ----Inputs are numbers:
	if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
   	then
   		if [ $second -eq 0 ]; then
        		echo "Cannot divide by zero."
    		else
        		answer=$(($first % $second))
        		echo the answer is $answer
		fi
	else 
		answer="!"
		
	fi
	
}

subtract() {
	

	read -p "enter first number: " first
	read -p "enter second number: " second
	# validation:  ----Inputs are numbers:
	if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
   	then
        	answer=$(($first - $second))
        	echo the answer is $answer
	else 
		answer="!"
	fi
	
}

menu() {
   PS3="Select an operation: "
    options=("Add" "Subtract" "Multiply" "Divide" "Power_of" "Modulus" "Exit")

    select menu_answer in "${options[@]}"; do
        case $menu_answer in
            "Add")
                add
                ;;
            "Subtract")
                subtract
                ;;
            "Multiply")
                multiply
                ;;
            "Divide")
                divide
                ;;
            "Power_of")
                power_of
                ;;
            "Modulus")
                modulus
                ;;
            "Exit")
                echo "Goodbye!"
                exit 0
                ;;
            *)
                echo "Invalid choice. Please select a valid option."
                ;;
        esac

        if [ "$answer" != "!" ]; then
                    answer=$(printf "%.0f" "$answer")
                    is_div_by_5
                    is_prime_number
                    check_even_odd
                else
                    echo "Invalid numbers"
                fi
        break  # Exit the inner select loop to display the menu again
    done
}

while true; do
menu
done
