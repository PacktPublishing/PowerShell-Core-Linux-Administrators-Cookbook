#Import the SqlServer module
Import-Module –Name SqlServer

#Read the CSV file content using Import-CSV cmdlet
Import-Csv -Path $filepath|ForEach-Object {

#The Linux SQL Instance IP Address
$SQLServer=$_.InstanceName

#Define credential details
$User=$_.Username

#Convert password text to a secure string
$Pass=ConvertTo-SecureString $_.Password -AsPlainText -Force

#Build the credential using securing string
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User,$Pass
$SQLServerObject=New-Object Microsoft.SqlServer.Management.Smo.Server $SQLServer
$SQLServerObject.ConnectionContext.LoginSecure=$false
$SQLServerObject.ConnectionContext.set_login($cred.Username)
$SQLServerObject.ConnectionContext.set_SecurePassword($cred.Password)

#Handle the exceptions using Try and Catch method
try
   {    #Build connection to the Local SQL Instance
    $SQLServerObject.ConnectionContext.connect()
    $db=New-Object Microsoft.SqlServer.Management.Smo.Database $SQLServerObject,'PacktPub'
    $db.Create()
    }
catch
    {
    #Write the exception message
    write-Error $_.Exception.message
    }
finally
    {
    #Close the connection
    $SQLServerObject.ConnectionContext.Disconnect()
    }
}