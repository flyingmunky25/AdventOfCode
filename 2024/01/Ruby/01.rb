# Read the input file
f = (File.readlines '../input.txt')

# Declare the variables needed
list1 = Array.new
list2 = Array.new
differenceList = Array.new
similaritiesList = Array.new

# Convert the input to separate arrays and integer values instead of string
f.each do |x|
  list1 << x.split(',')[0].to_i
  list2 << x.split(',')[1].to_i
end

# Sort the arrays smallest to largest
list1 = list1.sort
list2 = list2.sort

# Group the second array into a hash table for the second part of the problem
list2Grouped = list2.tally

# Perform the caluclations
list1.each_with_index do |element,index|
  # Part one, get the difference between matching array indexes, take the absolute value
  differenceList << (element - list2[index]).abs

  # Part two, perform the multiplication based on number of occurrances of the selected element.
  similaritiesList << (element * (list2Grouped[element] != nil ? list2Grouped[element] : 0))
end

# Write the output
puts "Part One: #{differenceList.inject(0,:+)}"
puts "Part Two: #{similaritiesList.inject(0,:+)}"