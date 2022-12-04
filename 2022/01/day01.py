# Read in the input file into lines variable
with open('input.txt', 'r') as f:
    lines = f.readlines()

# Create a new List object to store the sums
total_numbers = []

# Initialize the "sum" of each elves calories
elf_sum = 0

# Iterate over the input file. Sum the values until a blank line is reached then reset to 0
for x in lines:
    if x.strip() != '':
        elf_sum += int(x)
    else:
        total_numbers.append(elf_sum)
        elf_sum = 0
        
# Sort the array largest to smallest
total_numbers.sort(reverse = True)

# Calculate and print day 1 Part 1 (elf with the highest calorie count)
print("Part One:", total_numbers[0])

# Calculate and print day 1 part 2 (sum of top 3 elves)
top_three_total = total_numbers[0] + total_numbers[1] + total_numbers[2]
print("Part Two (using straight addition of array elements):", top_three_total)

#alternate ways to select and sum
## Part 2
print("Part Two (using array sum):", sum(total_numbers[:3]))