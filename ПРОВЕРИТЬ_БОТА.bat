@echo off
chcp 65001 >nul
title Проверка Tower Bot AI
color 0B

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║         ПРОВЕРКА TOWER BOT AI                       ║
echo ╚══════════════════════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo [1/3] Проверка запущенных процессов Python...
tasklist /FI "IMAGENAME eq python.exe" /FO LIST | findstr /I "python"
tasklist /FI "IMAGENAME eq py.exe" /FO LIST | findstr /I "py"
echo.

echo [2/3] Проверка файла bot.py...
if exist "bot.py" (
    echo ✅ Файл bot.py найден
    for %%A in (bot.py) do echo    Размер: %%~zA байт
) else (
    echo ❌ Файл bot.py не найден!
)
echo.

echo [3/3] Проверка базы данных...
if exist "tower_bot.db" (
    echo ✅ База данных найдена
    for %%A in (tower_bot.db) do echo    Размер: %%~zA байт
) else (
    echo ⚠️  База данных не создана (будет создана при первом запуске)
)
echo.

echo ═══════════════════════════════════════════════════════
echo   ИНСТРУКЦИЯ ПО ПРОСМОТРУ ЛОГОВ
echo ═══════════════════════════════════════════════════════
echo.
echo 1. Запустите бота командой: py bot.py
echo 2. Откройте окно PowerShell с ботом
echo 3. Все логи будут видны в этом окне
echo 4. Если видите ошибки - скопируйте их и отправьте разработчику
echo.
echo Для запуска бота нажмите любую клавишу...
pause >nul

cd /d "%~dp0"
py bot.py
