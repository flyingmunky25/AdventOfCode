# Read in the input file into lines variable
with open('johninput.txt', 'r') as f:
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