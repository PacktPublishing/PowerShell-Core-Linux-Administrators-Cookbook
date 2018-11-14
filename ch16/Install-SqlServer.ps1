# Run this as an administrator.

Set-PSRepository -Name PsGallery -InstallationPolicy Trusted

Install-Module SqlServer

if ((Get-Module -ListAvailable).Name -contains 'SqlServer') {
    Get-Command -CommandType Cmdlet | Where-Object Source -Match 'SQL' | Group-Object Source
}