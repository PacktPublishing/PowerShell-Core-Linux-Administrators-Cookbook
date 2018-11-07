$SQLServer='hqdbt01'
$SQLServerObject=New-Object Microsoft.SqlServer.Management.Smo.Server $SQLServer
$SQLServerObject.ConnectionContext.LoginSecure=$false
$SQLServerObject.ConnectionContext.set_login("SA")
$SQLServerObject.ConnectionContext.set_Password("PackPub@2018")           
$SQLServerObject.Information | Select-Object FullyQualifiedNetName, Parent, Version, Edition | Format-Table -AutoSize