@echo off
chcp 65001 >nul
cd %USERPROFILE%\Desktop
cls
del HACKED.txt 2>nul
cls
echo ¡Hola, %USERNAME%! ??
pause

:: Obtener IP privada
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do set IP=%%a

:: Crear archivo con datos
echo ¡Hola, %USERNAME%! > HACKED.txt
echo Tu dirección IP privada es: %IP% >> HACKED.txt
echo Nombre del equipo: %COMPUTERNAME% >> HACKED.txt
echo Fecha actual: %DATE% %TIME% >> HACKED.txt
echo Idioma del sistema: %LANG% >> HACKED.txt

cls
echo Mira tu escritorio... ???
pause
cls
echo ¿Sabes lo que es? ??
echo Cierra el Bloc de notas para continuar...
start /wait notepad.exe HACKED.txt
cls
del HACKED.txt 2>nul
cls
echo Esto parece un virus que roba información...
echo Tranquilo/a, no es real. Solo es una broma.
color 0c
echo Pero yo sí soy real. ??
pause
cls
echo Ahora voy a robar tu información... ??
pause
cls
echo ¿Quieres pintar algo? ??
start mspaint
pause
cls
echo Sinceramente, me gusta tu PC. Es muy bonita y acogedora. ??
pause
cls
echo Me encanta su nombre: %COMPUTERNAME%.
echo Espero que no te moleste que me quede aquí un rato...
echo Gracias por tu tiempo, %USERNAME%.
echo Tu PC ahora es mía. ??
echo Controlo lo que quiera...

setlocal

:: Crear script PowerShell temporal
set "script=%temp%\mover_mouse.ps1"
echo Add-Type -AssemblyName System.Windows.Forms > "%script%"
echo Add-Type -AssemblyName System.Drawing >> "%script%"
echo function Move-Smoothly($x1, $y1, $x2, $y2, $steps) { >> "%script%"
echo     for ($i = 0; $i -le $steps; $i++) { >> "%script%"
echo         $x = [int]($x1 + (($x2 - $x1) * $i / $steps)) >> "%script%"
echo         $y = [int]($y1 + (($y2 - $y1) * $i / $steps)) >> "%script%"
echo         [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y) >> "%script%"
echo         Start-Sleep -Milliseconds 20 >> "%script%"
echo     } >> "%script%"
echo } >> "%script%"
echo $rand = New-Object System.Random >> "%script%"
echo $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds >> "%script%"
echo $start = [System.Windows.Forms.Cursor]::Position >> "%script%"
echo $endTime = (Get-Date).AddSeconds(15) >> "%script%"
echo while ((Get-Date) -lt $endTime) { >> "%script%"
echo     $targetX = $rand.Next(0, $screen.Width) >> "%script%"
echo     $targetY = $rand.Next(0, $screen.Height) >> "%script%"
echo     Move-Smoothly $start.X $start.Y $targetX $targetY 50 >> "%script%"
echo     $start = New-Object System.Drawing.Point($targetX, $targetY) >> "%script%"
echo } >> "%script%"

:: Ejecutar el script
powershell -ExecutionPolicy Bypass -File "%script%"

:: Borrar el script temporal
del "%script%"

endlocal

pause
cls
echo ¿Ya lo tienes? ??
echo ¿Ya ves que me perteneces?
echo %USERNAME%, dime... ¿quieres que tu PC sea mía?
set /p answer=(S/N): 

:: Convertir respuesta a minúscula para comparar
set "answer=%answer:~0,1%"
if /i "%answer%"=="s" (
    cls
    echo ¡GRACIAS, %USERNAME%! ??
    echo AHORA TU PC ES MÍA. ??
) else (
    cls
    echo NO ME GUSTA QUE ME DIGAN QUE NO. ??
    echo PERO NO TE PREOCUPES, %USERNAME%...
    echo TU PC SEGUIRÁ SIENDO MÍA. ??
)

:: Apagar el sistema en 5 segundos
shutdown /s /t 5
set /p cancel=Escribe 20 veces "1" para cancelar el apagado: 
if /i "%cancel%"=="11111111111111111111" (
    cls
    shutdown /a
    echo Apagado cancelado. ??
    echo Gracias por tu colaboración, %USERNAME%.
    pause
) else (
    setlocal enabledelayedexpansion
    set "length=0"
    :countLoop
    if not "!cancel:~%length%,1!"=="" (
        set /a length+=1
        goto countLoop
    )
    cls
    echo No has escrito "1" 20 veces. ??
    echo Has escrito: !length! veces.
    echo El apagado continuará... ??
    pause
    endlocal
)