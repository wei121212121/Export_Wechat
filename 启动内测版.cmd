@echo off
setlocal EnableExtensions

set "APP_DIR=%~dp0"
set "APP_EXE=%APP_DIR%exportwechat-client.exe"
set "APP_MODEL=%APP_DIR%models"
set "DATA_ROOT=%ProgramData%\com.exportwechat.client"
set "DATA_MODEL=%DATA_ROOT%\models"

if not exist "%APP_EXE%" (
  echo ExportWeChat executable was not found.
  pause
  exit /b 1
)

if not exist "%APP_MODEL%\sensevoice\model.int8.onnx" (
  echo Voice model was not found in this package.
  pause
  exit /b 1
)

if exist "%DATA_MODEL%\sensevoice\model.int8.onnx" (
  cd /d "%APP_DIR%"
  start "" "%APP_EXE%"
  exit /b 0
)

if exist "%DATA_MODEL%\NUL" (
  echo A different model folder already exists at:
  echo %DATA_MODEL%
  echo Keep it to avoid overwriting another ExportWeChat installation.
  echo The program can download or use a model there.
  pause
  exit /b 1
)

if not exist "%DATA_ROOT%\NUL" mkdir "%DATA_ROOT%"
mklink /J "%DATA_MODEL%" "%APP_MODEL%"
if errorlevel 1 (
  echo Failed to create the voice-model link.
  echo Please run this script once as the same Windows user who runs ExportWeChat.
  pause
  exit /b 1
)

cd /d "%APP_DIR%"
start "" "%APP_EXE%"
