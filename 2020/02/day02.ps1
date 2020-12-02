# First way uses a Foreach loop and iterates over the entire input
$countOfGood = 0
Get-Content .\2020day02input.txt | %{$item = $_.Split(' '); $range = $item[0].Split('-');if(($item[2].ToCharArray() | ?{$_ -eq $item[1][0]} | Measure-Object).Count -in $range[0]..$range[1]){$countOfGood++}}
Write-Host $countOfGood

# Second approach uses Where-Object to select only the values that match
$values = Get-Content .\2020day02input.txt | ?{$item = $_.Split(' ');(($item[2].ToCharArray() -match $item[1][0]) | Measure).Count -in $item[0].Split('-')[0]..$item[0].Split('-')[1]}
Write-Host $values.Count

# Third approach is just the expanded version of the first approach for readibility.
$countOfGood = 0
$input = Get-Content .\2020day02input.txt
$input | ForEach-Object {
    $item = $_.Split(' ');
    $range = $item[0].Split('-');
    $char = $item[1][0]
    $pass = $item[2].ToCharArray();
    # The if check here does a where character == $char, meaning it selects all characters in the string that match our char, then counts it (with measure object)
    if(($pass | Where-Object {
            $_ -eq $item[1][0]
        } | Measure-Object).Count -in $range[0]..$range[1]) # measure the number of characters returned from the where-object, and see if its in the range.
        {
            $countOfGood++
        }
    }
Write-Host $countOfGood
