# Pfad zum übergeordneten Ordner anpassen
$folderPath = "C:\Users\Sebastian\source\elixir\repos\helloworld\"

# Alle .ex-Dateien rekursiv ermitteln
$files = Get-ChildItem -Path $folderPath -Filter *.ex* -Recurse

# Inhalte der Dateien zusammenfassen.
# Die foreach-Schleife wird in einen Subexpression-Block $() eingeschlossen, 
# damit ihre Ausgabe als Pipelineobjekte zur weiteren Verarbeitung (hier Out-String) geliefert wird.
$content = $(foreach ($file in $files) {
    "# Datei: $($file.FullName)"
    Get-Content -Path $file.FullName
    ""  # Leerzeile als Trenner
}) | Out-String

# Den zusammengesetzten Text in die Zwischenablage kopieren
$content | Set-Clipboard