"The script is located within:"
$PSScriptRoot

Read-Host "Press Enter to continue"

"Here is the complete path to the script that was run:"
$PSCommandPath

Read-Host "Press Enter to continue"

"Creating a new folder, demo-lab in the home directory, and adding files to it."

$Path = Join-Path $HOME 'demo-lab'
# Verbose: Join-Path -Path $HOME -ChildPath 'demo-lab'

"Creating files at the demo lab location."
New-Item $Path -ItemType Directory

'random-text.txt', 'himalayas.jpg', 'crunched-numbers.csv', 'screenshot-001.png', 'screenshot-002.png', 'screenshot-003.png', 'demo.doc', 'my-plugin.rb' | ForEach-Object { New-Item -Path (Join-Path -Path $Path -ChildPath $PSItem) -ItemType File }