# Read in the input file into lines variable
from os.path import dirname, join
current_dir = dirname(__file__)
file_path = join(current_dir, "./input.txt")
with open(file_path, 'r') as f:
    all_rounds = f.readlines()

# Initialize a dictionary with the possible outcomes and zero them out
all_data_dict = {
    "A X" : 0,
    "A Y" : 0,
    "A Z" : 0,
    "B X" : 0,
    "B Y" : 0,
    "B Z" : 0,
    "C X" : 0,
    "C Y" : 0,
    "C Z" : 0
}

for game in all_rounds:
    all_data_dict[game.strip()] += 1

# Calculate the values including the points
all_data_dict["A X"] *= 4
all_data_dict["A Y"] *= 8
all_data_dict["A Z"] *= 3
all_data_dict["B X"] *= 1
all_data_dict["B Y"] *= 5
all_data_dict["B Z"] *= 9
all_data_dict["C X"] *= 7
all_data_dict["C Y"] *= 2
all_data_dict["C Z"] *= 6

print("Part One: ", sum(all_data_dict.values()))

# Run part two
def winLoseDraw(x):
    # Lose
    if x == "X":
        return 0
    # Draw
    elif x == "Y":
        return 3
    # Win
    else:
        return 6

def shapeScore(shape):
    # Rock
    if shape == "A" or shape == "X":
        return 1
    # Paper
    elif shape == "B" or shape == "Y":
        return 2
    # Scissors
    else:
        return 3

def makeMeLose(shape):
    if shape == "A":
        return shapeScore("Z")
    elif shape == "B":
        return shapeScore("X")
    else:
        return shapeScore("Y")
    
def makeMeDraw(shape):
    if shape == "A":
        return shapeScore("X")
    elif shape == "B":
        return shapeScore("Y")
    else:
        return shapeScore("Z")

def makeMeWin(shape):
    if shape == "A":
        return shapeScore("Y")
    elif shape == "B":
        return shapeScore("Z")
    else:
        return shapeScore("X")

partTwoSum = 0
for game in all_rounds:
    value = game.strip()
    mine = value.split(' ')[1]
    theirs = value.split(' ')[0]
    WinLoseDrawScore = winLoseDraw(mine)
    if WinLoseDrawScore == 0:
        partTwoSum += WinLoseDrawScore + makeMeLose(theirs)
    elif WinLoseDrawScore == 3:
        partTwoSum += WinLoseDrawScore + makeMeDraw(theirs)
    else:
        partTwoSum += WinLoseDrawScore + makeMeWin(theirs)

print("Part Two: ", partTwoSum)

# # Create a new List object to store the sums
# total_numbers = []

# # Initialize the "sum" of each elves calories
# elf_sum = 0

# # Iterate over the input file. Sum the values until a blank line is reached then reset to 0
# for x in lines:
#     if x.strip() != '':
#         elf_sum += int(x)
#     else:
#         total_numbers.append(elf_sum)
#         elf_sum = 0
        
# # Sort the array largest to smallest
# total_numbers.sort(reverse = True)

# # Calculate and print day 1 Part 1 (elf with the highest calorie count)
# print("Part One:", total_numbers[0])

# # Calculate and print day 1 part 2 (sum of top 3 elves)
# top_three_total = total_numbers[0] + total_numbers[1] + total_numbers[2]
# print("Part Two (using straight addition of array elements):", top_three_total)

# #alternate ways to select and sum
# ## Part 2
# print("Part Two (using array sum):", sum(total_numbers[:3]))