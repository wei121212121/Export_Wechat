@echo off
setlocal EnableExtensions

set "APP_DIR=%~dp0"
set "APP_MODEL=%APP_DIR%models"
set "DATA_MODEL=%ProgramData%\com.exportwechat.client\models"

echo This will remove the bundled voice model and then start uninstall.exe.
choice /M "Continue"
if errorlevel 2 exit /b 0

rem Remove the compatibility junction only when it is a junction.
rmdir "%DATA_MODEL%" >nul 2>nul

if exist "%APP_MODEL%\NUL" rmdir /S /Q "%APP_MODEL%"

if exist "%APP_DIR%uninstall.exe" (
  start /wait "" "%APP_DIR%uninstall.exe"
) else (
  echo uninstall.exe was not found.
  pause
)
