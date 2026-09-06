@echo off
title MYRAA - Free Proxy Mode
color 0A

echo.
echo ============================================
echo   MYRAA AI Assistant - Free Proxy Mode
echo ============================================
echo.

:: Step 1: Check if gemini-web2api is running
echo [1/3] Checking proxy server...
curl -s http://localhost:8081/v1/models >nul 2>&1
if %errorlevel% neq 0 (
    echo       Proxy not running. Starting it now...
    start "MYRAA_Proxy" cmd /c "cd /d "%~dp0..\..\gemini-web2api" && python gemini_web2api.py --port 8081"
    timeout /t 3 /nobreak >nul
    curl -s http://localhost:8081/v1/models >nul 2>&1
    if %errorlevel% neq 0 (
        echo       ERROR: Proxy failed to start.
        echo       Make sure gemini-web2api is cloned next to this folder.
        echo       Git clone: git clone https://github.com/Sophomoresty/gemini-web2api.git
        pause
        exit /b 1
    )
)
echo       Proxy is running on port 8081.

:: Step 2: Set environment variable
echo.
echo [2/3] Setting GEMINI_WEB2API environment variable...
set GEMINI_WEB2API=http://localhost:8081

:: Step 3: Start MYRAA
echo.
echo [3/3] Starting MYRAA...
echo.
echo ============================================
echo   MYRAA is starting at http://localhost:3000
echo   Close this window to stop MYRAA.
echo ============================================
echo.

cd /d "%~dp0.."
npm run dev
