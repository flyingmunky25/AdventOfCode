def partOne(input)
    fabric = Array.new(1000) { Array.new(1000,0)}
 
    overlap = 0
    # Loop through each 'Claim' (each line in the input)
    noOverlapClaims = []
    input.each do |claim|
       claim.chomp!
       if claim != ""
 
          # plot the point on the fabric
          claimValues = claim.tr(':','').split(' ')
          padTop = claimValues[2].split(',')[1].to_i
          padLeft = claimValues[2].split(',')[0].to_i
          x = claimValues[3].split('x')[0].to_i
          y = claimValues[3].split('x')[1].to_i
 
          (padTop..(padTop+y)-1).each_with_index do |y,yIndex|
             (padLeft..(padLeft+x)-1).each_with_index do |x,xIndex|
                fabric[y][x] += 1
             end # end (padLeft....
          end # end (padTop.....
        end # end if != ""
    end # end input each (claim)
 
    # loop through and count the overlap
    fabric.each do |y|
       y.each do |x|
          if x > 1
             overlap += 1
          end # end if x>1
       end # end y.each
    end # end fabric.each
    
    input.each do |claim|
       claim.chomp!
       if claim != ""
          claimValues = claim.tr(':','').split(' ')
          claimID = claimValues[0].tr("\#",'').to_i
          padTop = claimValues[2].split(',')[1].to_i
          padLeft = claimValues[2].split(',')[0].to_i
          x = claimValues[3].split('x')[0].to_i
          y = claimValues[3].split('x')[1].to_i
          
          hasOverlap = false
          (padTop..(padTop+y)-1).each_with_index do |y,yIndex|
             (padLeft..(padLeft+x)-1).each_with_index do |x,xIndex|
                if fabric[y][x] > 1
                   hasOverlap = true
                   break
                end # end if fabric[][]
             end # end (padLeft...)
             if hasOverlap == true
                break
             end # end if hasOverlap
          end # end (padTop..)
          if hasOverlap == false         
             noOverlapClaims.push(claimID)
          end
       end # end if claim != ""
    end # end input.each
    return "NumOverlap: #{overlap}; NoOverLapClaimID: #{noOverlapClaims}"
 end
 
 def partTwo(input)
 
 end
 
 def solution
    input = File.readlines("usrple_input.txt")
    puts partOne(input)
 end
 
 solution
 