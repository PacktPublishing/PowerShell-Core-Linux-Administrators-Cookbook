$Guests = Import-Csv './chapter-07/05-Write-GuestSeatDetails.csv'

for ($CurrentGuest = 0; $CurrentGuest -lt $Guests.Length; $CurrentGuest++) {
    $Guest = $Guests[$CurrentGuest]

    $RowIdentifier = [byte][char](($Guest.Seat -split '-')[0].ToUpper())
    # Split the seat identifier at '-'                  :               $Guest.Seat -split '-'
    # Pick the first element from the resultant array   :              ($Guest.Seat -split '-')[0]
    # Enforce uppercase                                 :              ($Guest.Seat -split '-')[0].ToUpper()
    # Convert it to char                                :       [char](($Guest.Seat -split '-')[0].ToUpper())
    # Find the ASCII identifier                         : [byte][char](($Guest.Seat -split '-')[0].ToUpper())

    $RowNumber = ($RowIdentifier - 64).ToString()
    # A should be 1, B should be 2, C should be 3...

    switch -Regex ($RowNumber) {
        '1(1|2|3)$' { $RowNumber += 'th'; break } # Generate 11th, 12th, 13th
        '.?1$'      { $RowNumber += 'st'; break } # 1st, 21st
        '.?2$'      { $RowNumber += 'nd'; break } # 2nd, 22nd
        '.?3$'      { $RowNumber += 'rd'; break } # 3rd, 23rd
        Default     { $RowNumber += 'th'; break } # everything else from 1 to 26 should have 'th'.
    }

    $SeatNumber = ($Guest.Seat -split "-")[1]
    # Pick the numeric element

    if ($SeatNumber -gt 20) {
        $Side = 'right'
    }
    else {
        $Side = 'left'
    }

    Start-Sleep -Seconds 1
    Write-Host "Welcome, $($Guest.Name)! " -NoNewline # Subexpression `$Guest.Name` to be computed first.
    Start-Sleep -Seconds 1
    Write-Host "Your seat is in the $RowNumber row, to the $Side the aisle."
}