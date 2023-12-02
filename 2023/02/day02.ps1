$gameInput = Get-Content ./myInput.txt

$redMax = 12
$greenMax = 13
$blueMax = 14
$validGames = @()
$powerSetValues = @()

foreach ( $game in $gameInput )
{
    $gameID = [int]((Select-String -InputObject $game -Pattern "Game \d+" -AllMatches).Matches -replace 'Game|:')[0]
    
    $blues = (Select-String -InputObject $game -Pattern '\d{1,2} Blue' -AllMatches).Matches -replace ' Blue'
    $greens = (Select-String -InputObject $game -Pattern '\d{1,2} Green' -AllMatches).Matches -replace ' Green'
    $reds = (Select-String -InputObject $game -Pattern '\d{1,2} Red' -AllMatches).Matches -replace ' Red'

    $blueTotals = $blues | Measure-Object -Maximum -Minimum -Sum
    $greenTotals = $greens | Measure-Object -Maximum -Minimum -Sum
    $redTotals = $reds | Measure-Object -Maximum -Minimum -Sum

    if ( $blueTotals.Maximum -le $blueMax -and $redTotals.Maximum -le $redMax -and $greenTotals.Maximum -le $greenMax)
    {
        $validGames += [int]$gameID
    }

    $powerSetValues += ($blueTotals.Maximum * $greenTotals.Maximum * $redTotals.Maximum)
    
}

Write-Host "Part One: $(($validGames | Measure-Object -Sum).Sum)"
Write-Host "Part Two: $(($powerSetValues | Measure-Object -Sum).Sum)"