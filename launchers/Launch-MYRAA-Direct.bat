@echo off
title MYRAA AI Assistant - Direct API Mode (Full Memory)
color 0A

echo.
echo %SYSTEMROOT%\system32\chcp.com 65001 >nul
echo.

:: Step 1: Ensure proxy is running (needed for other features)
echo %SYSTEMROOT%\system32\tasklist "gemini_web2api.exe" >nul 2>&1
if %errorlevel% neq 0 (
    echo %SYSTEMROOT%\system32\start "MYRAA_Proxy" /B /MIN cmd /c "cd C:\Users\admin\Documents\gemini-web2api && python gemini_web2api.py --port 8081"
    timeout /t 3 /nobreak >nul
)

:: Step 2: Clear proxy env var for Direct API mode
echo %SYSTEMROOT%\system32\set "GEMINI_WEB2API=" >nul
set "GEMINI_WEB2API="

:: Step 3: Launch MYRAA (hidden console - no command prompt)
echo %SYSTEMROOT%\system32\start "" /B "C:\Users\admin\Documents\MYRAA\MYRAA-Portable-1.0.0.exe" >nul
timeout /t 5 /nobreak >nul

echo.
echo %SYSTEMROOT%\system32 echo.
echo ➀ MYRAA is launching with Direct API mode...
echo %SYSTEMROOT%\system32 echo.
echo ➁ Full memory extraction enabled - AI will learn from chat
echo %SYSTEMROOT%\system32 echo.
echo ➂ API key required (configured in .env)
echo %SYSTEMROOT%\system32 echo.
echo ➃ To toggle to Proxy mode, run: Launch-MYRAA-Proxy.bat
echo.
echo %SYSTEMROOT%\system32 pause >nul