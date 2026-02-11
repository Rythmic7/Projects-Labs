def main():
    # Get input from the user
    dodgers_score = int(input())
    yankees_score = int(input())
    cubs_score = int(input())
    
    # Print individual scores
    print(f"Last night the Dodgers scored {dodgers_score}")
    print(f"The Yankees scored {yankees_score}")
    print(f"The Cubs scored {cubs_score}")
    
    # Calculate and print total score
    total_score = dodgers_score + yankees_score + cubs_score
    print(f"\nThe total number of runs scored was {total_score}")
    
# Run the program
main()