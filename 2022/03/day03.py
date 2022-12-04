# Read in the input file into lines variable
from os.path import dirname, join
current_dir = dirname(__file__)
file_path = join(current_dir, "./input.txt")
with open(file_path, 'r') as f:
    lines = f.readlines()

upperAsciiOffset = 38
lowerAsciiOffset = 96

def calculatePriority(value):
    if value.isupper():
        return ord(value) - upperAsciiOffset
    elif value.islower():
        return ord(value) - lowerAsciiOffset
    else:
        return 0

priorities = []
partTwoGroups = []
partTwoPriorities = []

for line in lines:
    # Strip off the newline character
    value = line.strip()
    
    # Check if we should handle part two, or just append
    if len(partTwoGroups) < 3:
        partTwoGroups.append(value)
        
        # Check if the array is now "full" (3 values)
        if len(partTwoGroups) == 3:
            # It's full, let's process part two (the group of 3 elves)
            matching_priority = ''.join(set.intersection(set(partTwoGroups[0]), set(partTwoGroups[1]), set(partTwoGroups[2])))
            partTwoPriorities.append(calculatePriority(matching_priority))
            
            # Reset the lines array to empty
            partTwoGroups = []
        
    # Split the string into two parts
    compartment_a = value[:len(value)//2]
    compartment_b = value[len(value)//2:]
    
    # Determine the matching priority
    matching_priority = ''.join(set(compartment_a).intersection(compartment_b))
    
    # Store that priority in the array
    priorities.append(calculatePriority(matching_priority))
    
# Calculate the sum
print("Part One: ", sum(priorities))
print("Part Two: ", sum(partTwoPriorities))