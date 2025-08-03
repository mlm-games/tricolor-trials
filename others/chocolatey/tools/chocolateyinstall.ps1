$ErrorActionPreference = 'Stop'

$packageName = 'tricolor-trials'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/mlm-games/tricolor-trials/releases/download/0.2.0/tricolor-trials.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'Tricolor Trials*'
  checksum      = '0000000000000000000000000000000000000000000000000000000000000000'
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0)
}

# If destination doesn't exist, create it
$installDir = Join-Path $env:ProgramFiles $packageName
if (!(Test-Path $installDir)) {
  New-Item -ItemType Directory -Path $installDir | Out-Null
}

# Download the file
$fileLocation = Join-Path $installDir "$packageName.exe"
Get-ChocolateyWebFile @packageArgs -FileFullPath $fileLocation

# Create shortcut in Start Menu
$startMenu = Join-Path $env:ProgramData "Microsoft\Windows\Start Menu\Programs"
$shortcutFile = Join-Path $startMenu "$packageName.lnk"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutFile -TargetPath $fileLocation

Write-Host "$packageName has been installed to $installDir"
