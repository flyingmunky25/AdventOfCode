# Read in the input file into lines variable
from os.path import dirname, join
current_dir = dirname(__file__)
file_path = join(current_dir, "./input.txt")
with open(file_path, 'r') as f:
    lines = f.readlines()

