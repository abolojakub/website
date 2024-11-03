@echo off
setlocal

REM Ustawienie zmiennych
set "URL=https://abolojakub.github.io/website/py.zip"
set "ZIP_FILE=py.zip"
set "DISCORD_BOT_URL=https://raw.githubusercontent.com/abolojakub/website/main/discordBot.py"
set "DISCORD_BOT_FILE=discordBot.py"

REM Pobieranie pliku ZIP
echo Pobieranie pliku ZIP z %URL%...
curl -o "%ZIP_FILE%" "%URL%"

REM Sprawdzenie, czy pobieranie się powiodło
if exist "%ZIP_FILE%" (
    echo Plik pobrany pomyślnie: %ZIP_FILE%.

    REM Rozpakowywanie pliku ZIP za pomocą tar
    echo Rozpakowywanie pliku...
    tar -xf "%ZIP_FILE%" -C .

    REM Usuwanie pliku ZIP
    echo Usuwanie pliku ZIP...
    del "%ZIP_FILE%"
    echo Plik ZIP został usunięty.

    REM Pobieranie pliku discordBot.py
    echo Pobieranie pliku discordBot.py z %DISCORD_BOT_URL%...
    curl -o "%DISCORD_BOT_FILE%" "%DISCORD_BOT_URL%"

    REM Sprawdzenie, czy pobieranie discordBot.py się powiodło
    if exist "%DISCORD_BOT_FILE%" (
        echo Plik discordBot.py pobrany pomyślnie.
        
        REM Ustawienie zmiennych PATH
        echo Ustawianie zmiennej PATH...
        set PATH=%PATH%;C:\Users\maszyna wirtualna\Desktop\python
        set PATH=%PATH%;C:\Users\maszyna wirtualna\Desktop\python\Scripts
        echo Zmienna PATH została ustawiona na:
        echo %PATH%

        REM Automatyczne uruchamianie discordBot.py
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
