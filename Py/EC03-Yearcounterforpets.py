"""
Programmer: [Alberto Salvador, Alejandro Marti, Perez]
Date: September 19, 2025
Description:
This program asks the user for their cat's name and age (in cat years).
It then calculates and displays the equivalent human age:
- 1 cat year = 15 human years
- 2 cat years = 24 human years
- 3 or more cat years = 24 + 4 years for each extra cat year
The program rejects negative ages.
"""

# Constants
FIRST_YEAR_HUMAN = 15
SECOND_YEAR_HUMAN = 9
ADDITIONAL_YEAR_HUMAN = 4

# User input
cat_name = input("What is your cat's name: ")
cat_age = int(input("What is your cat's age: "))

# Check for invalid (negative) age
if cat_age < 0:
    print(f"{cat_age} years is an invalid age for {cat_name}.")
    print("Please run the program again!")

# Calculate human equivalent
elif cat_age == 1:
    human_age = FIRST_YEAR_HUMAN
    print(f"Your cat {cat_name} is {human_age} in human years")

elif cat_age == 2:
    human_age = FIRST_YEAR_HUMAN + SECOND_YEAR_HUMAN
    print(f"Your cat {cat_name} is {human_age} in human years")

else:  # 3 years and above
    human_age = FIRST_YEAR_HUMAN + SECOND_YEAR_HUMAN + (cat_age - 2) * ADDITIONAL_YEAR_HUMAN
    print(f"Your cat {cat_name} is {human_age} in human years")
