import math

def add(a, b):
    """Add two numbers."""
    return a + b

def subtract(a, b):
    """Subtract one number from another."""
    return a - b

def multiply(a, b):
    """Multiply two numbers."""
    return a * b

def divide(a, b):
    """Divide one number by another. Returns None if dividing by zero."""
    if b == 0:
        return None
    return a / b

def circle_area(radius):
    """Calculate the area of a circle given its radius."""
    if radius < 0:
        return None
    return math.pi * radius ** 2

def is_even(number):
    """Check if a number is even."""
    return number % 2 == 0

def greet(name):
    """Return a greeting message."""
    return f"Hello, {name}!"

def list_sum(numbers):
    """Calculate the sum of a list of numbers."""
    return sum(numbers)

# Example usage
if __name__ == "__main__":
    print("Add: ", add(2, 3))
    print("Subtract: ", subtract(5, 3))
    print("Multiply: ", multiply(4, 3))
    print("Divide: ", divide(10, 2))
    print("Circle Area: ", circle_area(5))
    print("Is Even: ", is_even(10))
    print("Greet: ", greet("Alice"))
    print("List Sum: ", list_sum([1, 2, 3, 4, 5]))