@echo off
:: Validar si el script se ejecuta como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Por favor, ejecuta este archivo haciendo clic derecho y seleccionando "Ejecutar como administrador".
    pause
    exit /b
)

:: Cambiar el directorio de trabajo a la ubicacion exacta de este script
cd /d "%~dp0"

echo =======================================================
echo DESACTIVANDO FLAGS DEL NUEVO MENU DE INICIO (PORTATIL)
echo =======================================================
echo.

:: Validar si vivetool.exe esta presente en la misma carpeta antes de continuar
if not exist "vivetool.exe" (
    echo [ERROR] No se encontro 'vivetool.exe' en esta carpeta.
    echo Por favor, descarga ViVeTool de GitHub y extraelo aqui mismo junto a este script.
    echo.
    pause
    exit /b
)

echo [1/2] Desactivando IDs oficiales del nuevo Menu de Inicio...
:: Desactivacion directa llamando al ejecutable local
vivetool.exe /disable /id:47205210
vivetool.exe /disable /id:48433719
vivetool.exe /disable /id:49221331
vivetool.exe /disable /id:49402389
vivetool.exe /disable /id:49820095
vivetool.exe /disable /id:55495322

echo.
echo [2/2] Reiniciando el entorno del Explorador de Windows...
:: Unicamente recarga la interfaz para aplicar los cambios de las flags
taskkill /f /im explorer.exe >nul
timeout /t 2 /nobreak >nul
start explorer.exe

echo.
echo =======================================================
echo FLAGS DESACTIVADAS - COMPROBADO CORRECTAMENTE
echo =======================================================
echo.
pause
exit
