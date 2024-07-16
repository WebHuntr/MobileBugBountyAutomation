# MobileBugBountyAutomation
This project contains the script necessary to automate the certificate and proxy setup to use browser stacks with a local MitM proxy, in this case it is using Burpsuite but could be edited to use any tool.
This will NOT work with apps that utilize certificate pinning.

Steps:
1. Create a BrowserStacks account and sign in at (https://www.browserstack.com/users/sign_up).
2. Download and install the local version of BrowserStack (https://www.browserstack.com/local-testing/downloads/native-app/BrowserStackLocal.msi)
3. Obtain your access key here (https://www.browserstack.com/accounts/settings/product).
4. Download the PowerShell script here (https://github.com/WebHuntr/MobileBugBountyAutomation/blob/main/Main.ps1).
5. Run the Powershell script, entering your access key from step 2 when prompted.
6. Login to BrowserStacks and launch an android device with an APK of choice.
7. Your traffic should now be routing through the proxy specified, default will be (127.0.0.1:8080).
