# Read in the input file into lines variable
from textwrap import wrap
import re
from os.path import dirname, join
current_dir = dirname(__file__)
file_path = join(current_dir, "./sampleinput.txt")
with open(file_path, 'r') as f:
    lines = f.readlines()
    
stacks = []
crateObjIncrementAmount = 4
for line in lines:
    if line.startswith("move"):
        print(line.strip())
    elif re.search("\[[a-zA-Z]\]", line):
        lineCharacterPosition = 1
        stackObjPosition = 1
        while lineCharacterPosition < len(line) and (lineCharacterPosition + crateObjIncrementAmount) < len(line):
            # Create the initial stack, and add to the overall list of stacks.
            stacks[stackObjPosition].append([])
            
            crateObj = line[lineCharacterPosition]
            
            if crateObj.isalpha():
                stacks[stackObjPosition]
            lineCharacterPosition += crateObjIncrementAmount
            stackObjPosition += 1
        # if crateObj.isalpha():
        #     print("is alpha character");
        #     print(line.rstrip('\n'))
    else:
        print("empty line")
    
    
    







# partOneOverlaps = 0
# partTwoOverlaps = 0

# for team in lines:
#     pair = team.strip().split(',')

#     xStart = int(pair[0].split('-')[0])
#     xEnd = int(pair[0].split('-')[1])
#     yStart = int(pair[1].split('-')[0])
#     yEnd = int(pair[1].split('-')[1])
    
#     xValues = range(xStart,xEnd+1)
#     yValues = range(yStart,yEnd+1)
    
#     matchingPairs = set(xValues).intersection(yValues)
    
#     partTwoOverlaps += 1 if len(matchingPairs) > 0 else 0
    
#     if ((yStart >= xStart and yEnd <= xEnd) or (xStart >= yStart and xEnd <= yEnd)):
#         partOneOverlaps += 1
        
# print("Part One:",partOneOverlaps)
# print("Part Two:", partTwoOverlaps)