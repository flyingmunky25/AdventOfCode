# Read in the input file into lines variable
from os.path import dirname, join
current_dir = dirname(__file__)
file_path = join(current_dir, "./input.txt")
with open(file_path, 'r') as f:
    lines = f.readlines()
    
numOverlaps = 0

for team in lines:
    pair = team.strip().split(',')
    assignments = []
    xStart = int(pair[0].split('-')[0])
    xEnd = int(pair[0].split('-')[1])
    yStart = int(pair[1].split('-')[0])
    yEnd = int(pair[1].split('-')[1])
    
    if ((yStart >= xStart and yEnd <= xEnd) or (xStart >= yStart and xEnd <= yEnd)):
        numOverlaps += 1
        
print(numOverlaps)