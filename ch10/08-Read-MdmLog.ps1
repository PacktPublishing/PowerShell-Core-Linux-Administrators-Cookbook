$AllLogLines = Get-Content ./08-mdm-reinstall-log.log
$UserTable = @()

foreach ($Line in $AllLogLines) {
    $Timestamp = ($Line.Split(' '))[0]

    $Line = $Line -replace ".+(DeviceActionEvent)\ \{", '{'
    $Line = $Line -replace '\]$'

    $JsonData = ConvertFrom-Json $Line
    $UserInfo = $JsonData.userDeviceInfo.userInfo

    $Record = [ordered]@{
        Timestamp       = Get-Date $Timestamp -Format d
        Username        = $UserInfo.userName
        EmailAddress    = $UserInfo.emailAddress 
    }

    $UserTable += New-Object -TypeName psobject -Property $Record
}
$UserTable = $UserTable | Sort-Object Username -Unique | Sort-Object Timestamp
$UserTable