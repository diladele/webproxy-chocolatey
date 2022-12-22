# Chocolatey Package for Web Filtering Proxy

This repo contains the sources of the Chocolatey package for Web Filtering Proxy. The current package is available at https://community.chocolatey.org/packages/webproxy/2.6.0/

## How to Build

Before trying to build the package make sure you have read the Quick Start Guide at https://docs.chocolatey.org/en-us/create/create-packages-quick-start. From now we we assume the following.

* You have installed a fresh instance of latest version of Windows 10. You have run the "Check for Updates" command and your machine is "Up-to-Date".
* You have installed the latest build of Chocolatey on it, see https://chocolatey.org/install
* You have run the ```git clone git@github.com:diladele/webproxy-chocolatey.git``` command and has access to the sources of this repo locally. For all examples below it will be assumed the repo lives in ```m:\diladele\webproxy-chocolatey.git``` folder.

First open the PowerShell command prompt (as normal user, not as administrator) and run the following commands.

```bash
# change into the target folder
cd m:\diladele\webproxy-chocolatey

# download the MSI
Invoke-WebRequest -Uri "https://packages.diladele.com/webproxy/2.6.0.0BF5/amd64/release/windows/webproxy-2.6.0.0BF5_amd64.msi" -OutFile "webproxy-2.6.0.0BF5_amd64.msi"

# calculate the sha256 hash of it
Get-FileHash "webproxy-2.6.0.0BF5_amd64.msi"

```

We will now need to manually adjust some variables in ``m:\diladele\webproxy-chocolatey\src\webproxy\tools\chocolateyinstall.ps1`` file.

```bash
# find and change the URL 
$url = 'https://packages.diladele.com/webproxy/2.6.0.0BF5/amd64/release/windows/webproxy-2.6.0.0BF5_amd64.msi'

# find and change the checksum
checksum = '5E61C7130CABD73949C72942824AC07E5C93C149BC57EB4AD5DB183C522A50DE'
```

Make sure the version value in the ```webproxy.nuspec``` corresponds with the version of the product, like ```<version>2.6.0</version>```. Finally run the following choco command to actually build the package.

```bash

# change into the folder with the package
cd m:\diladele\webproxy-chocolatey\src\webproxy

# and built it
choco pack
```

The output of this command will indicate the package was successfully built

```
m:\diladele\webproxy-chocolatey>choco pack
Chocolatey v0.12.1
Attempting to build package from 'webproxy.nuspec'.
Successfully created package 'm:\diladele\webproxy-chocolatey\src\webproxy\webproxy.2.6.0.nupkg'
```

## How to Test the Package by Installing from File

Now we need to test the package is corect by actually installing in. Run the following command in the *Adminstrative* prompt of the PowerShell.

```bash
# change into folder
cd m:\diladele\webproxy-chocolatey\src\webproxy\

# and install from local file
choco install dependency-windows10
choco install webproxy -s .
```

Navigate to the Start Menu, make sure Web Filtering Proxy is istalled normally. Ideally also try to set your browser to use the proxy and navigate to some sites. Proxy should be working and adult sites should be blocked.

## Publish the Package to Chocolatey Package Repository

To publish the package run the following commands replacing the ```[API_KEY_HERE]``` with actual key.

```
choco apikey -k [API_KEY_HERE] -source https://push.chocolatey.org/
choco push webproxy.2.6.0.nupkg -s https://push.chocolatey.org/
```