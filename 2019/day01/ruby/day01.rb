def main
    input = File.readlines("../day01-input.txt")
    partOne = input.map{|x| calculateMass(x.to_i,false)}.inject(:+)
    partTwo = input.map{|x| calculateMass(x.to_i,true)}.inject(:+)
    puts partOne
    puts partTwo
 end
 
 def calculateMass(mass, recurse)
    return 0 if mass < 9
    fuel = ((mass/3).floor)-2
    fuel += calculateMass(fuel, recurse: recurse) if recurse
    fuel
 end
 
 main
