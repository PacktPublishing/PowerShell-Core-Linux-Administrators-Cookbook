#Define Input variables
$dataSource = "10.2.6.50"
#Define the login credentials for SQL authentication
$user = "SA"
$pwd = "thanVitha@2015"
#Define the database name from which the data is going to be read
$database = "PacktPub"
#Build the connection string
$connStr = "Server=$dataSource;uid=$user; pwd=$pwd;Database=$database;Integrated Security=False;"
#Prepare the query
$query = "SELECT * FROM TaskManagerDump"
#Instantiate the sqlConnection namespace
$Conn = New-Object System.Data.SqlClient.SqlConnection
$Conn.ConnectionString = $connStr
#Open the connection
$Conn.Open()
#Create sub-objects to the Main object $Conn
$cmd = $Conn.CreateCommand()
#Assign the Query text to a $command object
$cmd.CommandText = $query
#Execute the adapter
$resultset = $cmd.ExecuteReader()
#Create an object DataTable namespace
$table = new-object "System.Data.DataTable"
#Load the data to the table
$table.Load($resultset)
$table |Where-Object {$_.ProcessName -match "pwsh"}
#$table |Where-Object {$_.ProcessName -match "pwsh"} | format-table -autosize
#$table |Where-Object {$_.ProcessName -match "pwsh"} | format-list
#$table |Where-Object {$_.ProcessName -match "pwsh"} | format-table $format
#$table | Where-Object {$_.ProcessName -match "pwsh"}| format-table $format | Out-File /tmp/output.txt
$Conn.Close()