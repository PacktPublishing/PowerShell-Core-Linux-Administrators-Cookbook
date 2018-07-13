function Initialize-PacktPs6CoreLinuxLab {
    param(
        # The location where the files need to be created
        [Parameter(Position=1)]
        [string]
        $Path = (Join-Path -Path $env:HOME -ChildPath random)
    )

    process {
        Clear-Host

        $CitiesPath = Join-Path -Path $Path -ChildPath cities

        Write-Warning "This is a quick-and-dirty function. Use this only to create your lab objects; not to learn scripting."

        New-Item $CitiesPath -ItemType Directory -Force | Out-Null

        Set-Location $Path
        New-Item 'random-text.txt', 'himalayas.jpg', 'crunched-numbers.csv', 'screenshot-001.png', 'screenshot-002.png', 'screenshot-003.png', 'demo.doc', 'my-plugin.rb' -ItemType File

        Write-Host 'Downloading city pages from Wikipedia'
        Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/Mumbai' -OutFile (Join-Path -Path $CitiesPath -ChildPath mumbai.html)
        Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/Cairo' -OutFile (Join-Path -Path $CitiesPath -ChildPath cairo.html)
        Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/Dubai' -OutFile (Join-Path -Path $CitiesPath -ChildPath dubai.html)
        Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/New_York_City' -OutFile (Join-Path -Path $CitiesPath -ChildPath nyc.html)
        Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/Paris' -OutFile (Join-Path -Path $CitiesPath -ChildPath paris.html)

        Write-Host 'Downloading some multimedia content'
        Invoke-WebRequest -Uri 'https://farm3.staticflickr.com/2912/33114379033_5bdee305fa_h.jpg?fdl=1' -OutFile (Join-Path -Path $Path -ChildPath volcano.jpg)
        Invoke-WebRequest -Uri 'https://farm8.staticflickr.com/7561/28010104522_f9b54051da_h.jpg?fdl=1' -OutFile (Join-Path -Path $Path -ChildPath coffee.jpg)
        Invoke-WebRequest -Uri 'https://player.vimeo.com/external/121142413.hd.mp4?s=55cd0e066b1b588b4121a6280da4a9d84bc97947&profile_id=119&oauth2_token_id=57447761&download=1' -OutFile (Join-Path -Path $Path -ChildPath matrix-like-wm.mp4)
        Invoke-WebRequest -Uri 'http://feeds.soundcloud.com/stream/265848849-wowamusik-piratosbeta.mp3' -OutFile (Join-Path -Path $Path -ChildPath piratos-wowa.me.mp3)
        Invoke-WebRequest -Uri 'https://unsplash.com/photos/NgtK0TdGT0Y/download?force=true' -OutFile (Join-Path -Path $Path -ChildPath bangalore.jpg)

        Write-Warning "If you encountered errors during the download, chances are that the content is missing from the original sources. Any content would do for the lab; download your own if you want to."

        Write-Host "`n`nCredits:`nCristian Ungureanu (http://mystock.photos/author/cristi/) for volcano.jpg and coffee.jpg`nSean Do (https://www.videezy.com/members/everywheresean) for matrix-like-wm.mp4`nWOWA (http://www.wowa.me/) for piratos-wowa.me.mp3`nAatur Harsh (https://unsplash.com/@aaturharsh) for bangalore.jpg`n"
    }
}

Initialize-PacktPs6CoreLinuxLab