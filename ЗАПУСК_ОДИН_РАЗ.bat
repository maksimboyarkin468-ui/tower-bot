@echo off
chcp 65001 >nul
title Tower Bot AI - Запуск (один раз!)
color 0A

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║         ЗАПУСК TOWER BOT AI                         ║
echo ║         ⚠️  ЗАПУСКАЙТЕ ТОЛЬКО ОДИН РАЗ!            ║
echo ╚══════════════════════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo [1/3] Остановка старых процессов...
taskkill /F /IM python.exe /T >nul 2>&1
taskkill /F /IM py.exe /T >nul 2>&1
timeout /t 2 /nobreak >nul
echo ✅ Старые процессы остановлены
echo.

echo [2/3] Проверка Python...
py --version >nul 2>&1
if errorlevel 1 (
    python --version >nul 2>&1
    if errorlevel 1 (
        echo ❌ Python не найден!
        pause
        exit /b
    )
    set PYTHON_CMD=python
) else (
    set PYTHON_CMD=py
)
echo ✅ Python найден
%PYTHON_CMD% --version
echo.

echo [3/3] Запуск бота...
echo.
echo ═══════════════════════════════════════════════════════
echo   БОТ ЗАПУСКАЕТСЯ...
echo ═══════════════════════════════════════════════════════
echo.
echo ⚠️  ВАЖНО: Не запускайте этот файл повторно!
echo    Если нужно перезапустить - сначала закройте это окно!
echo.
echo Для остановки нажмите Ctrl+C
echo.
echo ═══════════════════════════════════════════════════════
echo.

%PYTHON_CMD% bot.py

pause
