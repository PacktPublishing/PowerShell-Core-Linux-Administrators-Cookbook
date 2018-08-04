
Import-Csv ./input.csv|% { Invoke-Command -HostName $_.Server -UserName $_.User -ScriptBlock { Param ([string]$Server)
	Get-Process | Sort-Object CPU-Descending |`
        Select-Object Handles, CPU, `
        @{name = "NPM"; Expression = {[int]($_.NPM / 1024)}}, `
        @{name = "PM"; Expression = {[int]($_.PM / 1024)}}, `
        @{name = "WS"; Expression = {[int]($_.WS / 1024)}}, `
        @{name = "VM"; Expression = {[int]($_.VM / 1MB)}},`
	@{name = "ServerName"; Expression = {($Server)}},`
       	Id, ProcessName -First 5
}-Args $_.Server
}
