@echo off
chcp 65001 >nul
title Tower Bot AI - Запуск с логами
color 0A

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║         ЗАПУСК TOWER BOT AI С ЛОГАМИ                 ║
echo ╚══════════════════════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo Проверка Python...
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

echo ═══════════════════════════════════════════════════════
echo   ЗАПУСК БОТА...
echo ═══════════════════════════════════════════════════════
echo.
echo Все логи и ошибки будут видны ниже ↓
echo.
echo Для остановки нажмите Ctrl+C
echo.
echo ═══════════════════════════════════════════════════════
echo.

%PYTHON_CMD% bot.py

if errorlevel 1 (
    echo.
    echo ═══════════════════════════════════════════════════════
    echo   ❌ ОШИБКА ПРИ ЗАПУСКЕ!
    echo ═══════════════════════════════════════════════════════
    echo.
    echo Скопируйте текст ошибки выше и отправьте разработчику
    echo.
)

pause
