@Echo off
REM Change the current directory.
cd /d %~dp0

REM Get the application directory by specifying the Maya version (can be specified externally).
Set MAYA_VER=%1
if /%MAYA_VER%/==// Set MAYA_VER=2017
FOR /F "TOKENS=1,2,*" %%I IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\Maya\%MAYA_VER%\Setup\InstallPath" /v "MAYA_INSTALL_LOCATION"') DO IF "%%I"=="MAYA_INSTALL_LOCATION" SET MAYA_APP_PATH=%%K

REM Run a batch processing script.
"%MAYA_APP_PATH%bin\mayapy" %cd%\maya_scan_all.py

REM Download from github and run it if it doesn't work.
if %errorlevel% neq 0 (
    curl https://raw.githubusercontent.com/kissiy179/maya_scan_all/master/maya_scan_all.py | "%MAYA_APP_PATH%bin\mayapy"
)

pause