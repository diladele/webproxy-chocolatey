
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://packages.diladele.com/webproxy/2.3.0.C58B/amd64/release/windows/webproxy-2.3.0.C58B_amd64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  
  softwareName  = 'webproxy*'

  checksum      = '089D7FA6B13ED5E7C943BCAB24F1DD4FD06C155C7FDFD6A28A163188DEC2BBE6'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
