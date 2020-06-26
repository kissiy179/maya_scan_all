@Echo off
REM カレントディレクトリを現在のディレクトリに変更
cd /d %~dp0

REM Mayaバージョンを指定してアプリケーションフォルダを取得(外部から指定可)
Set MAYA_VER=%1
if /%MAYA_VER%/==// Set MAYA_VER=2016
FOR /F "TOKENS=1,2,*" %%I IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Autodesk\Maya\%MAYA_VER%\Setup\InstallPath" /v "MAYA_INSTALL_LOCATION"') DO IF "%%I"=="MAYA_INSTALL_LOCATION" SET MAYA_APP_PATH=%%K

REM バッチ処理スクリプトを実行
"%MAYA_APP_PATH%bin\mayapy" %cd%\maya_scan_all.py

REM 実行できなかった場合githubからダウンロードして実行
if %errorlevel% neq 0 (
    curl https://raw.githubusercontent.com/kissiy179/maya_scan_all/master/maya_scan_all.py | "%MAYA_APP_PATH%bin\mayapy"
)

pause