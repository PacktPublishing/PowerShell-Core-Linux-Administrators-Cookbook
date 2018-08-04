#Define the array of elements [1,2,3] 
1,2,3|foreach-object {
    #Build the name of the servers. Its going to be like PackPubDemo1,PackPubDemo2,PackPubDemo3
    $name='PackPubDemo'+$_
    #print the name of docker containers
    write-host $name
    try
      {
    #integrate the powershell variable with the docker cli command  
    docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=PacktPubDemo$2018' --name $name -d microsoft/mssql-server-linux:2017-latest
      }
    catch 
      {
    #Handle exception
      write-host $_.Exception.Message
      }
    }