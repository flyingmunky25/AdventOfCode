def partOne(input)
    twoCount = 0
    threeCount = 0
 
    input.each do |word|
       h = word.split('').each_with_object(Hash.new(0)) do |char,h| h[char] += 1 end
       twoCount += (h.select{|k,v| v == 2}.count > 0 ? 1 : 0)
       threeCount += (h.select{|k,v| v == 3}.count > 0 ? 1 : 0)
    end
    return twoCount*threeCount
 end
 
 def partTwo(input)
    arr = input.map(&:to_s)
    arr.combination(2) do |line1,line2|
       commonLetters = ""
       diffs = 0
       line1.each_char.with_index do |char, index|
          if line2[index] == char
             commonLetters += char
          else
             diffs += 1
          end
       end
       return commonLetters if diffs == 1
    end
 end
 
 def dayTwo
    input = File.readlines("usrple_input.txt")
    puts partOne(input)
    puts partTwo(input)
 end
 
 dayTwo
 