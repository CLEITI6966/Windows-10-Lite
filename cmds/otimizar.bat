@echo off
cls

:: Impressão das letras 3D estilizadas
echo.
echo  ________  ___       _______   ___  _________  ___  ________ ________  ________  ________     
echo |\   ____\|\  \     |\  ___ \ |\  \|\___   ___\\  \|\   ____\\  ___  \|\   ____\|\   ____\    
echo \ \  \___|\ \  \    \ \   __/|\ \  \|___ \  \_\ \  \ \  \___\ \____   \ \  \___|\ \  \___|    
echo  \ \  \    \ \  \    \ \  \_|/_\ \  \   \ \  \ \ \  \ \  \___\|____|\  \ \  \____\ \  \____   
echo   \ \  \____\ \  \____\ \  \_|\ \ \  \   \ \  \ \ \  \ \  ___  \ __\_\  \ \  ___  \ \  ___  \ 
echo    \ \_______\ \_______\ \_______\ \__\   \ \__\ \ \__\ \_______\\_______\ \_______\ \_______\
echo     \|_______|\|_______|\|_______|\|__|    \|__|  \|__|\|_______\|_______|\|_______|\|_______|
echo                                                                                              
echo                                                                                              
timeout /t 1 >nul

:: Explicação e execução do comando de transparência
echo Ativando a transparência do sistema...
timeout /t 1 >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f >nul
call :loading

:: Desativando a Cortana
echo Desativando a Cortana...
timeout /t 1 >nul
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul
call :loading

:: Ativando tema escuro para aplicativos e sistema
echo Aplicando o tema escuro para aplicativos e sistema...
timeout /t 1 >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
call :loading

:: Alterando a cor de destaque para cinza
echo Alterando a cor de destaque para cinza...
timeout /t 1 >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 00A0A0A0 /f >nul
call :loading

:: Reiniciando o Explorer para aplicar mudanças
echo Reiniciando o Explorer para aplicar as mudanças...
timeout /t 1 >nul
taskkill /f /im explorer.exe >nul
start explorer.exe
call :loading

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 1 /f >nul

:: Confirmando conclusão
cls
echo Todas as configurações foram aplicadas com sucesso!
timeout /t 2 >nul
exit

:loading
:: Simulação de carregamento com barra de progresso
setlocal enabledelayedexpansion
set percent=0
:load
cls
echo Carregando: !percent!%%
set /a percent+=10
timeout /t 0.1 >nul
if !percent! leq 100 goto load
endlocal
exit /b
