@echo off
setlocal
set "APP_DIR=%~dp0"
set "OUT=%APP_DIR%ExportWeChat-无限制内测版-完整便携包.zip"

copy /b "%APP_DIR%ExportWeChat-无限制内测版-完整便携包.zip.part001"+"%APP_DIR%ExportWeChat-无限制内测版-完整便携包.zip.part002" "%OUT%"
if errorlevel 1 (
  echo 合并失败：请确认三个 .part 文件都与本脚本放在同一个文件夹。
  pause
  exit /b 1
)

echo 合并完成：%OUT%
echo 现在可以解压这个 ZIP 文件。
pause
