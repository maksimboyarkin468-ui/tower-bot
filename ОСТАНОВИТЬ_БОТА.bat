@echo off
chcp 65001 >nul
echo ═══════════════════════════════════════════════════════════════
echo   ОСТАНОВКА БОТА TOWER BOT AI
echo ═══════════════════════════════════════════════════════════════
echo.

echo Останавливаю все процессы Python...
taskkill /F /IM python.exe /T >nul 2>&1
taskkill /F /IM py.exe /T >nul 2>&1

echo.
echo ✅ Все процессы остановлены!
echo.
pause
