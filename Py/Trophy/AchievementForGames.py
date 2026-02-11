def get_time_trophy(hours_played):
    """
    Determines the trophy earned based on hours played.
    
    Parameters:
    hours_played (int/float): The number of hours a player has played
    
    Returns:
    str: The name of the trophy earned
    """
    if hours_played >= 50:
        return "Valiant Veteran"
    elif hours_played >= 24:
        return "Humble Hero"
    elif hours_played >= 10:
        return "Active Adventurer"
    else:
        return "Trainee Traveller"

# Call the function for each of the four players
print(get_time_trophy(2))   # Trainee Traveller
print(get_time_trophy(11))  # Active Adventurer
print(get_time_trophy(33))  # Humble Hero
print(get_time_trophy(55))  # Valiant Veteran

# Additional tests for the new trophy level
print(get_time_trophy(24))  # Humble Hero
print(get_time_trophy(49))  # Humble Hero