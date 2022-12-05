# Read in the input file into lines variable
from os.path import dirname, join
current_dir = dirname(__file__)
file_path = join(current_dir, "./input.txt")
with open(file_path, 'r') as f:
    lines = f.readlines()
    
partOneOverlaps = 0
partTwoOverlaps = 0

allOverlappingValues = []

for team in lines:
    pair = team.strip().split(',')

    xStart = int(pair[0].split('-')[0])
    xEnd = int(pair[0].split('-')[1])
    yStart = int(pair[1].split('-')[0])
    yEnd = int(pair[1].split('-')[1])
    
    xValues = range(xStart,xEnd)
    
    for y in range(yStart,yEnd):
        if y in xValues:
            allOverlappingValues.append(y)
            
    if ((yStart >= xStart and yEnd <= xEnd) or (xStart >= yStart and xEnd <= yEnd)):
        partOneOverlaps += 1
        
print("Part One:",partOneOverlaps)

partTwoUnique = [*set(allOverlappingValues)]
print("Part Two:", len(partTwoUnique))