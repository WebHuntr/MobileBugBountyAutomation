# MobileBugBountyAutomation
This project contains the script necessary to automate the certificate and proxy setup to use browser stacks with a local MitM proxy, in this case it is using Burpsuite but could be edited to use any tool.

Simply change the extension to .ps1 on "Main.txt" or download "Main.ps1" if your firewall allows it.

Steps:
1. Create a BrowserStacks account and sign in at https://www.browserstack.com/users/sign_up
2. Obtain your access key from https://www.browserstack.com/accounts/settings/product
3. Download the PowerShell script main, and run it, entering access key from step 2 when prompted
4. Login to BrowserStacks and launch an android device with an APK of choice
5. Your traffic should now be routing through the proxy specified, default will be 127.0.0.1:8080
