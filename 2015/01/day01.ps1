$inputFile = Get-Content .\input.txt

$arr = $inputFile.ToCharArray()
Write-Host "Part 1 - $(($arr | Where-Object {$_ -eq '('}).Count - ($arr | Where-Object {$_ -eq ')'}).Count)"

$curFloor = 0
$position = 0
$arr.ForEach({
    $position += 1

    switch ($_)
    {
        '(' { $curFloor += 1}
        ')' { $curFloor -= 1}
    }
    if ( $curFloor -lt 0 )
    {
        Write-Host "Part 2 - $position"
        break
    }
})