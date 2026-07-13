$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # 1. Update all nav-link classes
    $content = [regex]::Replace($content, '(<a[^>]*class=")([^"]*\bnav-link\b[^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-medium' + $m.Groups[3].Value
    })
    
    # 2. Update Mobile Nav links
    $content = [regex]::Replace($content, '(<a[^>]*class=")([^"]*\bmobile-nav-link\b[^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-medium' + $m.Groups[3].Value
    })
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Fixed nav and button classes."
