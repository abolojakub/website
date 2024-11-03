@echo off
setlocal

REM Ustawienie zmiennych
set "URL=https://abolojakub.github.io/website/py.zip"
set "ZIP_FILE=py.zip"
set "DISCORD_BOT_URL=https://raw.githubusercontent.com/abolojakub/website/main/discordBot.py"
set "DISCORD_BOT_FILE=discordBot.py"

REM Pobieranie pliku ZIP
echo Pobieranie pliku...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%ZIP_FILE%'"

REM Sprawdzenie, czy pobieranie się powiodło
if exist "%ZIP_FILE%" (
    echo Plik pobrany pomyślnie: %ZIP_FILE%.

    REM Rozpakowywanie pliku ZIP
    echo Rozpakowywanie pliku...
    powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '.'"

    REM Usuwanie pliku ZIP
    echo Usuwanie pliku ZIP...
    del "%ZIP_FILE%"
    echo Plik ZIP został usunięty.

    REM Pobieranie pliku discordBot.py
    echo Pobieranie pliku discordBot.py...
    powershell -Command "Invoke-WebRequest -Uri '%DISCORD_BOT_URL%' -OutFile '%DISCORD_BOT_FILE%'"

    REM Sprawdzenie, czy pobieranie discordBot.py się powiodło
    if exist "%DISCORD_BOT_FILE%" (
        echo Plik discordBot.py pobrany pomyślnie.
        
        REM Ustawienie zmiennych PATH
        echo Ustawianie zmiennej PATH...
        set PATH=%PATH%;C:\Users\maszyna wirtualna\Desktop\python
        set PATH=%PATH%;C:\Users\maszyna wirtualna\Desktop\python\Scripts
        echo Zmienna PATH została ustawiona na:
        echo %PATH%

        REM Uruchamianie discordBot.py
        echo Uruchamianie discordBot.py...
        python "%DISCORD_BOT_FILE%"
        
    ) else (
        echo Wystąpił problem z pobraniem pliku discordBot.py.
    )
) else (
    echo Wystąpił problem z pobraniem pliku ZIP.
)

echo Proces zakończony.
endlocal
pause

