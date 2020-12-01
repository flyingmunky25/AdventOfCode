f = (File.readlines 'input.txt').map(&:to_i)

foundPartTwo = false
foundPartOne = false

f.each do |x|
    break if foundPartOne
    f.each do |y|
        break if foundPartOne # break the second loop if you've already found BOTH answers (foundPartOne will be found last)
        
        # Check for part 1 answer
        if (x+y == 2020 && !foundPartOne == true) then
            puts "Part One - #{x*y}"
            foundPartOne = true
        end

        # Continue looping for part 2
        f.each do |z|
            break if foundPartTwo # stop the loop if you've already found part two answer
            if ( x+y+z == 2020 ) then
                puts "Part Two - #{x*y*z}"
                foundPartTwo = true
                break
            end
        end
    end
end