
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://packages.diladele.com/webproxy/1.5.0.7B50/amd64/release/windows/webproxy-1.5.0.7B50_amd64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  
  softwareName  = 'webproxy*'

  checksum      = 'AD9F8FC59141CF4B43DAAF9DAE077037E55F945D5B1179D12BA892BE5561FA3A'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
