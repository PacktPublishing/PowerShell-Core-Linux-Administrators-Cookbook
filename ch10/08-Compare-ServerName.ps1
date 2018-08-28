$MyServers = Get-Content ./08-server-names-01.txt
$ModServers = Get-Content ./08-server-names-02.txt

Compare-Object -ReferenceObject $MyServers -DifferenceObject $ModServers