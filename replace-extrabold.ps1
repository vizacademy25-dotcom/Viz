$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # Replace all instances of font-extrabold with font-bold
    $content = $content -replace '\bfont-extrabold\b', 'font-bold'
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Replaced font-extrabold with font-bold."
