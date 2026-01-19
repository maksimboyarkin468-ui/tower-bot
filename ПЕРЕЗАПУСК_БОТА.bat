@echo off
chcp 65001 >nul
echo ═══════════════════════════════════════════════════════════════
echo   ПЕРЕЗАПУСК БОТА TOWER BOT AI
echo ═══════════════════════════════════════════════════════════════
echo.

echo [1/3] Останавливаю все процессы Python...
taskkill /F /IM python.exe /T >nul 2>&1
taskkill /F /IM py.exe /T >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/3] Ожидание завершения процессов...
timeout /t 2 /nobreak >nul

echo [3/3] Запускаю бота...
echo.
cd /d "%~dp0"
py bot.py

pause
