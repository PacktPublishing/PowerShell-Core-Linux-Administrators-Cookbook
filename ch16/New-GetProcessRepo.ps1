#Import the SqlServer Module
Import-Module -Name Sqlserver
#The Linux SQL Instance IP Address
$SQLServer='10.2.6.50'
#Define credential details
$User='SA'
#Convert password text to a secure string
$Pass=ConvertTo-SecureString 'thanVitha@2015' -AsPlainText -Force
#Build the credetial using securing string
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User,$Pass
(Get-Process | Select-Object -Property `    Id,ProcessName,StartTime,UserProcessorTime,WorkingSet,Description) | `
Write-SqlTableData -Credential $cred -ServerInstance "localhost" -DatabaseName `
"PacktPub" -SchemaName "dbo" -TableName "TaskManagerDump" -Force