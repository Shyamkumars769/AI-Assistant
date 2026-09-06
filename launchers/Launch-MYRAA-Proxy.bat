@echo off
title MYRAA AI Assistant - Proxy Mode (Free Gemini Chat)
color 0A

echo.
echo %SYSTEMROOT%\system32\chcp.com 65001 >nul
echo.

:: Step 1: Ensure proxy is running
echo %SYSTEMROOT%\system32\tasklist "gemini_web2api.exe" >nul 2>&1
if %errorlevel% neq 0 (
    echo %SYSTEMROOT%\system32\start "MYRAA_Proxy" /B /MIN cmd /c "cd C:\Users\admin\Documents\gemini-web2api && python gemini_web2api.py --port 8081"
    timeout /t 3 /nobreak >nul
)

:: Step 2: Set environment variable
echo %SYSTEMROOT%\system32\set "GEMINI_WEB2API=http://localhost:8081" >nul
set "GEMINI_WEB2API=http://localhost:8081"

:: Step 3: Launch MYRAA (hidden console - no command prompt)
echo %SYSTEMROOT%\system32\start "" /B "C:\Users\admin\Documents\MYRAA\MYRAA-Portable-1.0.0.exe" >nul
timeout /t 5 /nobreak >nul

echo.
echo %SYSTEMROOT%\system32 echo.
echo ➀ MYRAA is launching with FREE Gemini chat mode...
echo %SYSTEMROOT%\system32 echo.
echo ➁ Proxy mode active - chat via free gateway
echo %SYSTEMROOT%\system32 echo.
echo ➂ Memory preserved from previous sessions
echo %SYSTEMROOT%\system32 echo.
echo ➃ To toggle to Direct mode, run: Launch-MYRAA-Direct.bat
echo.
echo %SYSTEMROOT%\system32 pause >nul