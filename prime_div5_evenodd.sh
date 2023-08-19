#!/bin/bash
check_even_odd() {
    if (( $1 % 2 == 0 )); then
        echo "The number is even."
    else
        echo "The number is odd."
    fi
}


is_div_by_5() {
if (( $1 % 5 == 0 )); then
echo "The number is divisible by 5."
else
echo "The number is not divisible by 5."
fi
}

is_prime_number() {
if [[ $1 -lt 2 ]]
then
  echo "$number is not a prime number"
  return 0
else
  local i=2
  while [ $i -lt $number ] 
  do
         if [[ `expr $number % $i` -eq 0 ]]
         then
            echo "$number is not a prime"
            return 0
       fi
  let i=$i+1
 done
fi
echo "$number is a prime"
}

