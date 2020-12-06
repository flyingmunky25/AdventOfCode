def main
    passports = File.read("input.txt").split("\n\n")
    
    passports.map! do |passport|
        passport.scan(/(\w+)\:(\S+)/).to_h
    end

    puts passports
end

main