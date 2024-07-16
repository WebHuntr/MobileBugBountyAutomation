# MobileBugBountyAutomation
This project contains the script necessary to automate the certificate and proxy setup to use browser stacks with a local MitM proxy, in this case it is using Burpsuite but could be edited to use any tool.
This will NOT work with apps that utilize certificate pinning.

Steps:
1. Create a BrowserStacks account and sign in at (https://www.browserstack.com/users/sign_up).
2. Obtain your access key here (https://www.browserstack.com/accounts/settings/product).
3. Download the PowerShell script here (https://github.com/WebHuntr/MobileBugBountyAutomation/blob/main/Main.ps1).
4. Run the Powershell script, entering your access key from step 2 when prompted.
5. Login to BrowserStacks and launch an android device with an APK of choice.
6. Your traffic should now be routing through the proxy specified, default will be (127.0.0.1:8080).
