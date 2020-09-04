# debloat
Windows 10 Debloat Script
This script is specifically designed to debloat windows 10. It partially accomplishes this by disabling telemetry services, scheduled tasks and bloatware packages. 

to run this script you will need to follow a few setup steps
1) run powershell as admin
2) unblock the file from from your script execution policy
Unblock-File -Path .\windows10debloatV6.ps1
or set the script script execution policy to undefined
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser
