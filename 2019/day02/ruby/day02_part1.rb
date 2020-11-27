def main
    # Read input file, convert it to an integer array.
    input = File.read("../input.txt").split(",").map(&:to_i)
    
    # Replace the initial as instructed
    input[1] = 12
    input[2] = 2

    idx = 0
    
    while true
        break if input[idx] != 1 and input[idx] != 2
        opcode = input[idx] == 1 ? "+" : "*"

        x = input[idx+1]
        y = input[idx+2]
        dest = input[idx+3]

        input[dest] = input[x].public_send(opcode,input[y])
        idx += 4
    end

    puts input[0]
end

main
