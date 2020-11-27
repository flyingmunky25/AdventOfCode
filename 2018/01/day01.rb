def partOne(input)
    return input.map(&:to_i).inject(:+)   
 end
 
 def partTwo(input)
    freqArray = Array.new
    curFreq = 0
    input = input.map(&:to_i)
    found = false
    until found
       input.each{|num|
          curFreq += num
          if freqArray.include? curFreq
             found = true
             break
          else
             freqArray.push(curFreq)
          end
       }
    end
    return curFreq
 end
 
 def dayOne
    input = File.readlines("input.txt")
    puts partOne(input)
    puts partTwo(input)
 end
 
 dayOne
 