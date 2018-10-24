function Set-Name {
    $Name = @()
    $Name = Read-Host "Enter first name"
    $Name += Read-Host "Enter middle name (press Enter for blank)"
    $Name += Read-Host "Enter surname"

    $Count = $Name.Count
    $Converter = (Get-Culture).TextInfo

    switch ($Count) {
        2 { 
            "$($Converter.ToTitleCase($Name[1])), $($Converter.ToTitleCase($Name[0]))"
        }
        3 {
            "$($Converter.ToTitleCase($Name[2])), $($Converter.ToTitleCase($Name[0])) $($Converter.ToTitleCase($Name[1]))"
        }
        Default {
            Write-Host "Invalid input."
        }
    }
}
Set-Name