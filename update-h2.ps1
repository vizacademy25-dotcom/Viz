$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # H2 -> Bold (replace font-extrabold with font-bold)
    $content = [regex]::Replace($content, '(<h2[^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-extrabold\b', 'font-bold'
        $m.Groups[1].Value + $cls + $m.Groups[3].Value
    })
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Updated H2 to Bold."
