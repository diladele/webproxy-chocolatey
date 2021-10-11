
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://packages.diladele.com/webproxy/1.6.0.347A/amd64/release/windows/webproxy-1.6.0.347A_amd64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  
  softwareName  = 'webproxy*'

  checksum      = 'B71014EE946E59D88413D8CB4AED2F5D02E6FA3D34C068A5D8BD3EA5F4AAD83C'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
