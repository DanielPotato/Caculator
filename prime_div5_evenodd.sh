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

        if [[ "$answer" == "!" ]]; then
            echo "Invalid numbers."
        else
            is_div_by_5
            is_prime_number
            check_even_odd
        fi
        break  # Exit the inner select loop to display the menu again
    done
}

while true; do
menu
done
