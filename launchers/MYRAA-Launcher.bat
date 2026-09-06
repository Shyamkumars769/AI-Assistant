@echo off
title MYRAA AI Assistant
color 0A

echo.
echo ============================================
echo   MYRAA AI Assistant - One-Click Launcher
echo ============================================
echo.

:: Step 1: Check if gemini-web2api is running
echo [1/3] Checking proxy server...
curl -s http://localhost:8081/v1/models >nul 2>&1
if %errorlevel% neq 0 (
    echo       Proxy not running. Starting it now...
    start "MYRAA_Proxy" cmd /c "cd /d "%~dp0..\..\gemini-web2api" && python gemini_web2api.py --port 8081"
    timeout /t 3 /nobreak >nul
)

:: Step 2: Set environment variable
echo [2/3] Setting environment...
set GEMINI_WEB2API=http://localhost:8081

:: Step 3: Start MYRAA
echo [3/3] Starting MYRAA...
echo.
echo ============================================
echo   Open http://localhost:3000 in your browser
echo   Close this window to stop MYRAA.
echo ============================================
echo.

cd /d "%~dp0.."
npm run dev
