###Admin Elevation###
#This If statement is just checking if you are admin, and elevating the script to admin if not, this is required because the script needs to write changes to the "Program files (x86)" directory, which requires admin permission (lines 21, 21, 24)
if(!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
 Exit
}

#-------------------------------------------------------------------------------#
#CHANGE THESE FOR DIFFERENT PROXY
$ProxyIP = "127.0.0.1" #Set to default Burpsuite proxy ip, change if needed
$ProxyPort = "8080" #Set to default Burpsuite port, change if needed
#-------------------------------------------------------------------------------#

###Static Variables###
$Download = "http://${ProxyIP}:${ProxyPort}/cert"  # If you are using a proxy other than Burpsuite, this will need to be changed.
Write-Output("Obtain Access key from below URL")
Write-Output("https://www.browserstack.com/accounts/settings/product") # Tells user where to get BrowserStack Access Key
$AccessKey = (Read-Host "Enter your Browserstacks Access Key") # Prompts user for email, so we can get the access-key from Browserstacks

###The actual script###
cd "C:\Program Files (x86)\BrowserStackLocal" # Switches to the Browserstack install directory
rm "*.pem" # Removes any old .pem files in the Directory
rm "*.der" # Removes any old .der files in the directory
Invoke-WebRequest -Proxy "${ProxyIP}:${ProxyPort}" -uri $Download -OutFile cacert.der # Downloads the Burpsuite Certificate file and saves it as "cacert.der"
certutil -encode cacert.der cacert.pem # Changes the burpsuite cert from a .pem files to a .der file, Browserstacks requires it to be a .der
taskkill /F /IM "BrowserStack*" # Kills any running instance of Browserstack to prevent possible errors
.\BrowserStackLocalApp.exe --key $AccessKey --force-proxy --proxy-host $ProxyIP --proxy-port $ProxyPort --force-local --use-ca-certificate .\cacert.pem # Actually starts Browser Stack
