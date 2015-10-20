::TOOLS for scripts 
:: AzCopy
::  https://azure.microsoft.com/en-us/documentation/articles/storage-use-azcopy/
:: AzureStorageCleanup
::  https://github.com/nwoolls/AzureStorageCleanup
:: 7-Zip
::  http://www.7-zip.org/

::Example of full address: https://xyzxyzxyzxyz.core.windows.net/daily-backups
set relativeSource=Daily
set storageName=xyzxyzxyzxyz
set container=daily-backups
set destKey=403987503485703480435043Dy8IkhTqE34796523489FVS0sKJ5XXJgNpcJWg==
set minDaysOld=7

set relativeTempFolder=temp
set destHost=https://%storageName%.blob.core.windows.net
set physicalPath=%~dp0
set source="%physicalPath%%relativeSource%"
REM Get local date and time
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set dateTag=%YYYY%%MM%%DD%
set dest=%destHost%/%container%/%dateTag%
set relativeTempZip="%relativeTempFolder%/%dateTag%.zip"

:: zip backup folder, no compression
call 7-Zip\7za.exe a -mx3 "%relativeTempZip%" "%physicalPath%%relativeSource%\*"

echo Runing backup %dateTag%
"%physicalPath%AzCopy\AzCopy.exe" /Source:%relativeTempFolder% /Dest:%dest% /DestKey:%destKey% /Y /V:Logs\log-%dateTag%.txt

echo Cleaning old backups
"%physicalPath%AzCleanup\AzureStorageCleanup.exe" -storagename %storageName% -storagekey  %destKey% -container %container% -mindaysold  %minDaysOld%

:: cleanup
call RD /S /Q "%relativeTempFolder%"

::pause
