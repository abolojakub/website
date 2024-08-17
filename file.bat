@echo off
setlocal

rem Wersja Pythona do pobrania
set PYTHON_VERSION=3.11.4

rem URL do pobrania Python Embeddable
set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-embed-amd64.zip

rem Nazwa pliku zip do pobrania
set ZIP_FILE=python-%PYTHON_VERSION%-embed-amd64.zip

rem Katalog docelowy dla Pythona
set INSTALL_DIR=%~dp0python

rem Pobieranie Python Embeddable
echo Downloading Python %PYTHON_VERSION%...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %ZIP_FILE%"

rem Rozpakowywanie pliku
echo Extracting Python...
powershell -Command "Expand-Archive -Path %ZIP_FILE% -DestinationPath %INSTALL_DIR%"

rem Usuwanie pliku zip
del %ZIP_FILE%

rem Ustawianie ścieżki do Pythona w PATH
set "PYTHON_PATH=%INSTALL_DIR%"
setx PATH "%PYTHON_PATH%;%PATH%"

rem Sprawdzenie wersji Pythona
echo Python version:
python.exe --version

rem Wywołanie Pythona z pełną ścieżką
echo Run Python:
%INSTALL_DIR%\python.exe

endlocal
pause
