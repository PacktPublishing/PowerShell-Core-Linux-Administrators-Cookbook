function prompt {
    $Location = (Get-Location).Path.ToString()
    switch -Wildcard ($Location) {
        "/home/$env:USERNAME" { $Location = '~'; break }
        "/home/$env:USERNAME/Documents" { $Location = 'Documents'; break }
        "/home/$env:USERNAME/Downloads" { $Location = 'Downloads'; break }
        "/home/$env:USERNAME/Pictures" { $Location = 'Pictures'; break }
        "/home/$env:USERNAME/Videos" { $Location = 'Videos'; break }
        "/home/$env:USERNAME/Music" { $Location = 'Music'; break }
        "/home/$env:USERNAME/Documents/code" { $Location = 'Code'; break }
        "/home/$env:USERNAME/*" { $Location = $Location.Replace("/home/$env:USERNAME/", '~/'); break }
        Default { }
    }

    Write-Host "PS " -NoNewline
    Write-Host `
        ($($env:USERNAME) + "@" + "$([System.Net.Dns]::GetHostByName((hostname)).HostName) ") `
        -NoNewLine -ForegroundColor Cyan
    Write-Host "$Location" -NoNewline -ForegroundColor Green
    Write-Host ("`n> ") -NoNewline
    return " "
}