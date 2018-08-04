$Top = @()

$process =Import-Csv ./input.csv|% { Invoke-Command -HostName $_.Server -UserName $_.User -ScriptBlock { Param($Server)
	Get-Process | Sort-Object CPU-Descending |`
        Select-Object Handles, CPU, `
        @{name = "NPM"; Expression = {[int]($_.NPM / 1024)}}, `
        @{name = "PM"; Expression = {[int]($_.PM / 1024)}}, `
        @{name = "WS"; Expression = {[int]($_.WS / 1024)}}, `
        @{name = "VM"; Expression = {[int]($_.VM / 1MB)}},`
	@{name = "ServerName"; Expression = {($server)}},`
       	Id, ProcessName -First 5
}-Args $_.Server
}

foreach ($proc in $process) {
		
            $row = New-Object -Type PSObject -Property @{
                ServerName  = $proc.Servername
                ID          = $proc.ID
                ProcessName = $proc.ProcessName
                NPM_KB      = $proc.NPM
                PM_KB       = $proc.PM
                WS_KB       = $proc.WS
                VM_MB       = $proc.VM
                CPU_S       = $proc.CPU
            }         
            $Top += $row
        }
                    
 $Top | ConvertTo-Html |Out-File /tmp/out.html 
