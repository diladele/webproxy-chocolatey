
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://packages.diladele.com/webproxy/2.7.0.46CE/amd64/release/windows/webproxy-2.7.0.46CE_amd64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  
  softwareName  = 'webproxy*'

  checksum      = '28EE1F4FDCA9F93B65B1865AF2CD6E973D4BE63A0ECFFCF1273D873E04707641'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
