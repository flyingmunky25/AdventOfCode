$inputFile = Get-Content .\myInput.txt

$runningTotal = @()
foreach ( $game in $inputFile )
{
    $gameID = [int]((Select-String -InputObject $game -Pattern "Card\s+\d+" -AllMatches).Matches -replace 'Card|:|\s')[0]
    Write-Host $gameID

    $values = ($game -split ': ')[1]
    $myNumbers = ($values -split ' \| ')[1] -replace '\s+',',' -split ','
    $winningNumbers = ($values -split ' \| ')[0] -replace '\s+',',' -split ','

    $myMatches = $myNumbers | Where-Object {$_ -in $winningNumbers }
    Write-Host "-- $($myMatches -join ',')"

    $total = 1 * [Math]::Floor([Math]::Pow(2,$myMatches.Count-1))
    $runningTotal += $total
    write-host "---- $total"
}

Write-Host "Part One: $(($runningTotal | Measure-Object -Sum).Sum)"