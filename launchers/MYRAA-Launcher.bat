@echo off
title MYRAA AI Assistant - One-Click Launcher
color 0A

echo.
echo ╔═════════════════════════════════════════════════════════════
echo ║          MYRAA AI Assistant - One-Click Launcher           ║
echo ║                                                              ║
echo ║  Starting gemini-web2api proxy (FREE Gemini chat)...        ║
echo ║  This provides Gemini chat without API key requirement.     ║
echo ║                                                              ║
echo ╚═════════════════════════════════════════════════════════════
echo.

:: Step 1: Start the proxy server in background
echo.
echo ➀ Starting proxy server...
cd /d "C:\Users\admin\Documents\gemini-web2api"
start "MYRAA_Proxy" cmd /c "python gemini_web2api.py --port 8081"
timeout /t 3 /nobreak >nul

:: Step 2: Set the environment variable
echo.
echo ➁ Setting GEMINI_WEB2API environment variable...
set GEMINI_WEB2API=http://localhost:8081
echo.

:: Step 3: Launch MYRAA
echo.
echo ➂ Launching MYRAA AI Assistant...
echo.
start "" "C:\Users\admin\Documents\MYRAA\MYRAA-Portable-1.0.0.exe"
timeout /t 5 /nobreak >nul

echo.
echo ➃ MYRAA is starting! A chat window should appear shortly.
echo.
echo ➄ To exit: Close the MYRAA window, then close this window
echo.
pause