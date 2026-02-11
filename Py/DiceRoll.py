import random

# Ask user how many times to repeat the experiment
num_rolls = int(input("How many times would you like to repeat the experiment? "))

# Initialize loop counter and running total
roll_count = 0
total_sum = 0

# Use a while loop to repeat the experiment
while roll_count < num_rolls:
    # Roll two six-sided dice.
    first_die = random.randint(1, 6)
    second_die = random.randint(1, 6)
    dice_sum = first_die + second_die
    print("You rolled a " + str(dice_sum) + "!")
    
    # Add dice_sum to running total
    total_sum = total_sum + dice_sum
    
    # Increment the counter
    roll_count = roll_count + 1

# Calculate and print the average
average = total_sum / num_rolls
print("The average of all " + str(num_rolls) + " rolls is " + str(average) + ".")