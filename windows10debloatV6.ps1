<# Windows 10 debloat script V5.2 #>
<# Designed for Build 17134 or below #>


<# service disable #>
Stop-Service DiagTrack -Force
Stop-Service diagnosticshub.standardcollector.service -Force
Stop-Service dmwappushservice -Force
Set-Service DiagTrack -StartupType Disabled
Set-Service diagnosticshub.standardcollector.service -StartupType Disabled
Set-Service dmwappushservice -StartupType Disabled

Write-host "Do you want to disable cortana? (Default is No)" -ForegroundColor Yellow 
    $cortana = Read-Host " ( y / n ) " 
    Switch ($cortana) 
     { 
       Y {Write-host "Cortana has been disabled `n"; reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f } 
       N {Write-Host "Cortana has not been disabled `n";} 
       Default {Write-Host "you probably should have entered a y or n as this message is the result of neither being entered `n";}
     }
Write-host "Do you run windows on a Solid State drive? (Default is Yes)" -ForegroundColor Yellow 
    $SSD = Read-Host " ( y / n ) " 
    Switch ($SSD) 
     { 
       Y {Write-Host "No problem, the superfetch service has not been disabled `n";}
       N {Write-host "The Superfetch service has been disabled`n"; stop-service SysMain -Force -NoWait ; set-service SysMain -StartupType Disabled} 
       Default {Write-Host "you probably should have entered a y or n as this message is the result of neither being entered `n";}
     }
Write-host "Do you use the XBOX app or XBOX game pass? (Default is No)" -ForegroundColor Yellow 
    $xbone = Read-Host " ( y / n ) " 
    Switch ($xbone) 
     { 
       Y {Write-host "This script has left the service alone `n";} 
       N {Write-Host "The Xbox App has now been disabled `n"; Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage; Get-AppxPackage Microsoft.XboxApp| Remove-AppxPackage; Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage; schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable} 
       Default {Write-Host "you probably should have entered a y or n as this message is the result of neither being entered `n"; Remove-AppxPackage; Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage; schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable; Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage} 
     }
Write-host "Do you want us to leave the windows store intact? (Default is Yes)" -ForegroundColor Yellow 
    $store = Read-Host " ( y / n ) " 
    Switch ($store) 
     { 
       Y {Write-host "this script has not uninstalled the windows store`n";} 
       N {Write-Host "his script has uninstalled the windows store `n"; Get-AppxPackage Microsoft.WindowsStore | Remove-AppxPackage; Get-AppxPackage Microsoft.StorePurchaseApp | Remove-AppxPackage; Get-AppxPackage Microsoft.ConnectivityStore | Remove-AppxPackage} 
       Default {Write-Host "you probably should have entered a y or n as this message is the result of neither being entered `n";} 
     }

<# scheduled task disable #>
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitorToastTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable
schtasks /Change /TN "Microsoft\Windows\Data Integrity Scan\Data Integrity Scan" /Disable
schtasks /Change /TN "Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable
 

<# remove packages #>

Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.OneConnect | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.Todo.List | Remove-AppxPackage
Get-AppxPackage Microsoft.Whiteboard | Remove-AppxPackage
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage Microsoft.Advertising.Xaml | Remove-AppxPackage
Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage Microsoft.Wallet | Remove-AppxPackage
Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage "*PandoraMediaInc*" | Remove-AppxPackage
Get-AppxPackage "*CandyCrush*" | Remove-AppxPackage
Get-AppxPackage "*Twitter*" | Remove-AppxPackage
Get-AppxPackage "*Duolingo-LearnLanguagesforFree*" | Remove-AppxPackage
Get-AppxPackage "*AdobeSystemsIncorporated.AdobePhotoshopExpress*" | Remove-AppxPackage
Get-AppxPackage "*ActiproSoftwareLLC*" | Remove-AppxPackage
Get-AppxPackage "*EclipseManager*" | Remove-AppxPackage
Get-AppxPackage "*BubbleWitch3Saga*" | Remove-AppxPackage
Get-AppxPackage "*Wunderlist*" | Remove-AppxPackage
Get-AppxPackage "*Flipboard*" | Remove-AppxPackage
Get-AppxPackage "*Facebook*" | Remove-AppxPackage
Get-AppxPackage "*Minecraft*" | Remove-AppxPackage
Get-AppxPackage "*Royal Revolt*" | Remove-AppxPackage
Get-AppxPackage "*Sway*" | Remove-AppxPackage
Get-AppxPackage "*Speed Test*" | Remove-AppxPackage
Get-AppxPackage "*Dolby*" | Remove-AppxPackage

<# Registry tweaks #>
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v Start /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v AutoConnectAllowedOEM /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowAutoConnectToWiFiSenseHotspots" /v value /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\TabletInputService" /v Start /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f 
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoTileApplicationNotification /t REG_DWORD /d 1 /f


<# Changelog V5.0 #>
<# 
cleaned up language on qustion portion of the script
added 6 scheduled tasks to the schtasks section
added steps to remove cortana app packages by inforced ownership then removal of source package also a reg key add 
#>
<# Changelog V5.1 #>
<# 
Removed unused variables
changed legacy sc commands to stop-service commands
added reg key to disable the tablet input service for security reasons
added reg key to disable location tracking
#>
<# Changelog V5.2 #>
<# 
rephased the SSD question
removed most of the cortana script due to repercussions of full disable of search service
added package removal for the xbox gaming overlay to the xbox question
added reg key that Sets privacy policy accepted state to 0
#>
<# Changelog V6 #>
<# 
updated Packages to current standard
added reg keys
#>