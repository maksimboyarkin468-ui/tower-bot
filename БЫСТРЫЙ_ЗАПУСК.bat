@echo off
chcp 65001 >nul
title Tower Bot AI - Быстрый запуск
color 0A

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║         TOWER BOT AI - БЫСТРЫЙ ЗАПУСК                ║
echo ╚══════════════════════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo [1/4] Проверка Python...
py --version >nul 2>&1
if errorlevel 1 (
    python --version >nul 2>&1
    if errorlevel 1 (
        echo ❌ Python не найден!
        echo.
        echo Установите Python: https://www.python.org/downloads/
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

echo [2/4] Проверка зависимостей...
%PYTHON_CMD% -c "import aiogram" >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Зависимости не установлены. Устанавливаю...
    %PYTHON_CMD% -m pip install aiogram aiosqlite --quiet
    if errorlevel 1 (
        echo ❌ Ошибка установки зависимостей!
        pause
        exit /b
    )
    echo ✅ Зависимости установлены
) else (
    echo ✅ Зависимости установлены
)
echo.

echo [3/4] Проверка токена...
findstr /C:"YOUR_BOT_TOKEN_HERE" bot.py >nul
if not errorlevel 1 (
    echo.
    echo ═══════════════════════════════════════════════════════
    echo   ⚠️  ТОКЕН НЕ НАСТРОЕН!
    echo ═══════════════════════════════════════════════════════
    echo.
    echo Для запуска бота нужно настроить токен.
    echo.
    echo 1. Получите токен от @BotFather в Telegram
    echo 2. Откройте файл bot.py
    echo 3. Найдите строку: BOT_TOKEN = ...
    echo 4. Замените YOUR_BOT_TOKEN_HERE на ваш токен
    echo.
    echo Или используйте PowerShell:
    echo   $env:BOT_TOKEN="ваш_токен"
    echo   $env:ADMIN_IDS="ваш_id"
    echo   py bot.py
    echo.
    echo Подробная инструкция в файле: НАСТРОЙКА_ТОКЕНА.txt
    echo.
    pause
    exit /b
)
echo ✅ Токен настроен
echo.

echo [4/4] Запуск бота...
echo.
echo ═══════════════════════════════════════════════════════
echo   БОТ ЗАПУСКАЕТСЯ...
echo ═══════════════════════════════════════════════════════
echo.
echo Для остановки нажмите Ctrl+C
echo.
echo ═══════════════════════════════════════════════════════
echo.

%PYTHON_CMD% bot.py

if errorlevel 1 (
    echo.
    echo ═══════════════════════════════════════════════════════
    echo   ❌ ОШИБКА ПРИ ЗАПУСКЕ БОТА
    echo ═══════════════════════════════════════════════════════
    echo.
    echo Проверьте:
    echo - Токен правильный и настроен
    echo - Интернет подключен
    echo - Бот создан в @BotFather
    echo.
)

pause
