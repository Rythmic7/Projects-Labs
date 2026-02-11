"""
Programmer: [Alberto Salvador, Alejandro Marti, Perez]
Date: [9/21/2025]
Description: This program asks the user for a number and computes the sum of
the first N positive integers using the formula:
    sum = (number * (number + 1)) / 2
The program validates the input to ensure it is within the range 1..1531.
"""

# Prompt the user for input
user_number = int(input("Enter a number: "))

# Check for invalid entries
if user_number <= 0:
    print(f"{user_number} is and invalid entry. You must enter a positive whole number!")
    print("Please run the program again!")
elif user_number > 1531:
    print(f"While {user_number} is a positive number it is an invalid entry.")
    print("Please run the program again and enter numbers in 1..1531 range!")
else:
    # Compute the sum using the formula
    total_sum = (user_number * (user_number + 1)) // 2  # use integer division
    print(f"The sum of the first {user_number} positive integers is {total_sum}")