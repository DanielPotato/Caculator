#!/bin/bash

#Made by : David
#ADD function#-----------------------
add() {
    local answer=0
    read -p "Enter the first number: " first
    read -p "Enter the second number: " second

    # validation:  ----Inputs are numbers:
    if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "The answer is $((first + second))"
    else 
        echo "Invalid numbers"
    fi
}

#MOD function#-----------------------
modulus() {
    local answer=0
    read -p "Enter the first number: " first
    read -p "Enter the second number: " second

    # validation:  ----Inputs are numbers:
    if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        if [ $second -eq 0 ]; then
            echo "Cannot divide by zero."
        else
            echo "The answer is $((first % second))"
        fi
    else 
        echo "Invalid numbers"
    fi
}

# Subtract function
subtract() {
    local answer=0
    read -p "Enter the first number: " first
    read -p "Enter the second number: " second

    # validation:  ----Inputs are numbers:
    if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "The answer is $((first - second))"
    else 
        echo "Invalid numbers"
    fi
}

# Multiply function
multiply() {
    local answer=0
    read -p "Enter the first number: " first
    read -p "Enter the second number: " second

    # validation:  ----Inputs are numbers:
    if [[ $first =~ ^-?[0-9]+(\.[0-9]+)?$ && $second =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "The answer is $((first * second))"
    else 
        echo "Invalid numbers"
    fi
}

# Power_of function
power_of() {
    local answer=0
    read -p "Enter the base number: " base
    read -p "Enter the exponent: " exponent

    # validation:  ----Inputs are numbers:
    if [[ $base =~ ^-?[0-9]+(\.[0-9]+)?$ && $exponent =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "The answer is $((base ** exponent))"
    else 
        echo "Invalid numbers"
    fi
}

# Divide function
divide() {
    local answer=0
    read -p "Enter the numerator: " numerator
    read -p "Enter the denominator: " denominator

    # validation:  ----Inputs are numbers:
    if [[ $numerator =~ ^-?[0-9]+(\.[0-9]+)?$ && $denominator =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        if [ $denominator -eq 0 ]; then
            echo "Cannot divide by zero."
        else
            echo "The answer is $(bc <<< \"scale=2; $numerator / $denominator\")"
        fi
    else 
        echo "Invalid numbers"
    fi
}

# Menu function
menu() {
    select menu_answer in Add Subtract Multiply Divide Power_of Modulus Exit
    do
        case $menu_answer in
            Add)
                add
                ;;
            Subtract)
                subtract
                ;;
            Multiply)
                multiply
                ;;
            Divide)
                divide
                ;;
            Power_of)
                power_of
                ;;
            Modulus)
                modulus
                ;;
            Exit)
                exit 0
                ;;
            *)
                echo "Try again. Your input should be one of the available options."
                ;;
        esac
    done
}

menu
