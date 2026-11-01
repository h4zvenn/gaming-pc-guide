@echo off
setlocal
title Gaming PC Guide - Read-only diagnostics

where powershell.exe >nul 2>nul
if errorlevel 1 (
    echo Windows PowerShell was not found.
    pause
    exit /b 1
)

powershell.exe -NoLogo -NoProfile -File "%~dp0GamingPCGuide-Diagnostics.ps1"
if errorlevel 1 (
    echo.
    echo The diagnostic menu could not start. Check your PowerShell execution policy.
    pause
    exit /b 1
)

exit /b 0
