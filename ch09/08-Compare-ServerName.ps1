$MyServers = Get-Content ./ch09/08-server-names-01.txt
$ModServers = Get-Content ./ch09/08-server-names-02.txt

Compare-Object -ReferenceObject $MyServers -DifferenceObject $ModServers