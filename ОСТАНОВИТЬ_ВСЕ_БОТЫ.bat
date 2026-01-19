@echo off
chcp 65001 >nul
title Остановка всех процессов бота
color 0C

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║         ОСТАНОВКА ВСЕХ ПРОЦЕССОВ БОТА               ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo [1/2] Остановка всех процессов Python...
taskkill /F /IM python.exe /T >nul 2>&1
taskkill /F /IM py.exe /T >nul 2>&1
timeout /t 2 /nobreak >nul

echo ✅ Все процессы остановлены
echo.

echo [2/2] Проверка оставшихся процессов...
tasklist /FI "IMAGENAME eq python.exe" 2>nul | findstr /I "python" >nul
if errorlevel 1 (
    echo ✅ Процессы Python не найдены
) else (
    echo ⚠️  Обнаружены процессы Python
    tasklist /FI "IMAGENAME eq python.exe"
)

tasklist /FI "IMAGENAME eq py.exe" 2>nul | findstr /I "py" >nul
if errorlevel 1 (
    echo ✅ Процессы py.exe не найдены
) else (
    echo ⚠️  Обнаружены процессы py.exe
    tasklist /FI "IMAGENAME eq py.exe"
)

echo.
echo ═══════════════════════════════════════════════════════
echo   ВСЕ ПРОЦЕССЫ ОСТАНОВЛЕНЫ
echo ═══════════════════════════════════════════════════════
echo.
echo Теперь можно запустить бота заново:
echo 1. Запустите файл: ЗАПУСТИТЬ_БОТА_С_ЛОГАМИ.bat
echo 2. Или через PowerShell: py bot.py
echo.
echo ⚠️  ВАЖНО: Запускайте бота ТОЛЬКО ОДИН РАЗ!
echo    Если запустите несколько раз - будет конфликт!
echo.

pause
