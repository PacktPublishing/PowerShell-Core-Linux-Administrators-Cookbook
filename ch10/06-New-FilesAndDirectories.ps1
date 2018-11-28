Set-Location (Join-Path $HOME random)

Join-Path dir-01, dir-02, dir-03, dir-04 -ChildPath demo.txt | ForEach-Object { New-Item $PSItem -ItemType File }

'random-text.txt', 'himalayas.jpg', 'crunched-numbers.csv', 'screenshot-001.png', 'screenshot-002.png', 'screenshot-003.png', 'demo.doc', 'my-plugin.rb' | ForEach-Object { New-Item (Join-Path dir-01 -ChildPath $PSItem) -ItemType File }

Rename-Item screenshot-001.png myscreenshot.png
# Verbose version: Rename-Item -Path screenshot-001.png -NewName myscreenshot.png

Copy-Item myscreenshot.png dir-02
# Verbose version: Copy-Item -Path myscreenshot.png -Destination ./dir-02

Remove-Item dir-04 -Recurse
# Verbose version: Remove-Item -Path ./dir-04 -Recurse