function Get-AllImages {
    param(
        # Get the base image name
        [Parameter(Mandatory=$true)]
        [string]
        $Repo
    )
    begin {
        $UriTest = Invoke-WebRequest "https://registry.hub.docker.com/v1/repositories/$Repo/tags" -DisableKeepAlive -UseBasicParsing
        if ($UriTest.StatusCode -eq 200) {
            # Just proceed
        }
        else {
            break
        }
    }
    process {
        (Invoke-WebRequest "https://registry.hub.docker.com/v1/repositories/$Repo/tags" | ConvertFrom-Json).SyncRoot.Name
    }
}

# Call the function as `Get-AllImages -Repo centos`