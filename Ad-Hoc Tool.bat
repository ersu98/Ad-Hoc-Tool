@ECHO off
color a
cls
title Ad-Hoc Network Creator

:start
cls
ECHO Ad-Hoc Network Creator
ECHO.
ECHO Select an option:
ECHO.             
ECHO 1.    Start
ECHO 2.    Stop
ECHO 3.    Settings
ECHO 4.    Help
ECHO 5.    Exit
ECHO.  
set /p choice=Option :     

if '%choice%'==''  goto badcommand
if '%choice%'=='1' goto starthost
if '%choice%'=='2' goto stop
if '%choice%'=='3' goto settings
if '%choice%'=='4' goto help
if '%choice%'=='5' goto exit

:badcommand
cls
@echo off
ECHO "%choice%" is not a valid option, please try again!
pause >nul
goto start

:starthost
cls
ECHO Starting Network...
netsh wlan start hostednetwork
goto start

:stop
cls
ECHO Stopping Network...
netsh wlan stop hostednetwork
@echo off
goto start

:settings
cls
ECHO Network Settings
ECHO.
ECHO Select an option:
ECHO.             
ECHO 1.    Easy Setup
ECHO 2.    Advanced Setup
ECHO 3.    Help
ECHO.
ECHO 4.    More commands..
ECHO 5.    Back..
ECHO.  
set /p choice=Option :     

if '%choice%'==''  goto badcommand
if '%choice%'=='1' goto setup1
if '%choice%'=='2' goto setup2
if '%choice%'=='3' goto helpsetup
if '%choice%'=='4' goto usefuloptions
if '%choice%'=='5' goto start

:usefuloptions
cls
@echo off
ECHO Network Settings
ECHO.
ECHO Select an option:
ECHO.             
ECHO 1.    Show detailed network information
ECHO 2.    Show info dump
ECHO 3.    Refresh network key
ECHO 4.    Show filters
ECHO 5.    Show wlan settings
ECHO 6.    Show trace status
ECHO 7.    Show profiles
ECHO 8.    Show wlan report
ECHO.    
ECHO 9.    Next page..  
ECHO 10.   Back..  
ECHO.
set /p choice=Option :     

if '%choice%'==''  goto badcommand
if '%choice%'=='1' goto detailedinfo
if '%choice%'=='2' goto infodump
if '%choice%'=='3' goto refresh1
if '%choice%'=='4' goto showfilters
if '%choice%'=='5' goto wlansettings
if '%choice%'=='6' goto tracing
if '%choice%'=='7' goto showprofiles
if '%choice%'=='8' goto wlanreport
if '%choice%'=='9' goto usefuloptions2
if '%choice%'=='10' goto settings

:usefuloptions2
cls
@echo off
ECHO Network Settings
ECHO.
ECHO Select an option:
ECHO.             
ECHO 1.    Show networks
ECHO 2.    Show interfaces
ECHO 3.    Show MAC randomization 
ECHO 4.    Show blocked networks
ECHO 5.    Connect to a network
ECHO 6.    Help - Connect to a network
ECHO 7.    
ECHO 8.    
ECHO.    
ECHO 9.    Previous page..  
ECHO 10.   Back..  
ECHO.
set /p choice=Option :     

if '%choice%'==''  goto badcommand
if '%choice%'=='1' goto shownetworks
if '%choice%'=='2' goto showinterfaces
if '%choice%'=='3' goto randomization
if '%choice%'=='4' goto blockednetworks
if '%choice%'=='5' goto connect1
if '%choice%'=='6' goto connect1help
if '%choice%'=='7' goto badcommand
if '%choice%'=='8' goto badcommand
if '%choice%'=='9' goto usefuloptions
if '%choice%'=='10' goto settings

:connect1help
ECHO    Connect to the wireless network given by the ssid. Connection is 
ECHO    attempted from the specified interface unless there is only one 
ECHO    available interface on the system.
ECHO.
ECHO    If the specified interface is already connected to the wireless network,
ECHO    this command will first disconnect from the connected network,
ECHO    then attempt to connect to the new network. However, if these two networks
ECHO    are the same this command simply returns success and does nothing.
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions2

:connect1
cls
@echo off
set /p profilename=SSID of network :  
netsh wlan connect ssid=%profilename%
ECHO.
ECHO Returning to menu...
timeout 1
goto start

:blockednetworks
cls
@echo off
netsh wlan show blockednetworks
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions2

:randomization
cls
@echo off
netsh wlan show randomization
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions2

:showinterfaces
cls
@echo off
netsh wlan show interfaces
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions2

:shownetworks
cls
@echo off
netsh wlan show networks
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions2

:wlanreport
cls
@echo off
netsh wlan show wlanreport
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:showprofiles
cls
@echo off
netsh wlan show profiles
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:refresh1
cls
@echo off
netsh wlan refresh hostednetwork key
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:showfilters
cls
@echo off
netsh wlan show filters
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:tracing
cls
@echo off
netsh wlan show tracing
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:wlansettings
cls
@echo off
netsh wlan show settings
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:detailedinfo
cls
@echo off
netsh wlan show all
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:infodump
cls
@echo off
netsh wlan dump
ECHO.
ECHO Press any key to continue...
pause >nul
goto usefuloptions

:back1
goto settings

:setup1
cls
@echo off
ECHO Network Easy Setup
ECHO.
set /p ssid=Enter a name for your network :  
set /p password=Enter a password for your network :  
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%password% keyUsage=persistent
ECHO.
ECHO Returning to menu...
timeout 1
ECHO.
goto start

:setup2
cls
@echo off
ECHO Network Advanced Setup
ECHO.
set /p ssid=Enter a name for your network :  
set /p password=Enter a password for your network :  
set /p keyusage=Do you want TEMPORARY or PERSISTENT key :  
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%password% keyUsage=%keyUsage%
ECHO.
ECHO Returning to menu...
timeout 1
ECHO.
goto start

:helpsetup
cls
@echo off
ECHO Ad-Hoc Setup Help
ECHO.
ECHO Easy Setup: Lets you set SSID and PASSWORD.
ECHO.
ECHO Advanced Setup: Lets you set SSID, PASSWORD and TEMPORARY or PERSISTENT KEY.
ECHO.
ECHO More options gives a list of commands that can be used with the Ad-Hoc Network. 
ECHO.
pause >nul
goto settings

:help
cls
@echo off
ECHO Ad-Hoc Network Help
ECHO.
ECHO Did you remember to share your Ethernet/Wired connection to your Wireless Adapter.
ECHO You may be able to use your Wireless connection shared, dependent on your network adapter.
ECHO.
ECHO Note: You may need to run this program as an administrator to get all features!
ECHO Note: You dont need to have this program open to use the network, you can simply close this application afterwards. This is just to manage the ad-hoc network!
ECHO.
ECHO.
ECHO 1.    Back..
ECHO 2.    Show Creator info
ECHO.
set /p choice=Option :     

if '%choice%'==''  goto badcommand
if '%choice%'=='1' goto start
if '%choice%'=='2' goto creatorinfo

:exit
exit

:creatorinfo
ECHO.
ECHO.
ECHO.
ECHO                         Tool made by Erik S
ECHO.
ECHO.
ECHO                         Contact info:
ECHO.
ECHO                         Skype  = ersu98
ECHO                         Steam  = http://steamcommunity.com/profiles/76561198042134261/
ECHO                         GitHub = https://github.com/ersu98
ECHO.
pause >nul
goto start


































REM       Script made by Erik S      YT = https://www.youtube.com/channel/UCc1OK_Y--hcNG9abwzsvdrg
REM                               Skype = ersu98