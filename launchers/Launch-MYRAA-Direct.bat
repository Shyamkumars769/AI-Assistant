@echo off
title MYRAA - Direct API Mode
color 0B

echo.
echo ============================================
echo   MYRAA AI Assistant - Direct API Mode
echo ============================================
echo.

:: Step 1: Check for API key
echo [1/2] Checking API key...
if not exist "..\..\.env" (
    if not exist "..\..\.env.local" (
        echo       WARNING: No .env file found.
        echo       Create a .env file with: GEMINI_API_KEY=your_key_here
        echo.
    )
)

:: Step 2: Start MYRAA (no proxy)
echo [2/2] Starting MYRAA (Direct API mode)...
echo.
echo ============================================
echo   MYRAA is starting at http://localhost:3000
echo   Close this window to stop MYRAA.
echo ============================================
echo.

cd /d "%~dp0.."
set GEMINI_WEB2API=
npm run dev
