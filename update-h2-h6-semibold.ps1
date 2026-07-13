$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # Target H2 to H6
    $content = [regex]::Replace($content, '(<h[2-6][^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-(bold|normal|extrabold)\b', ''
        
        # Avoid duplicating font-semibold if it's already there
        if ($cls -notmatch '\bfont-semibold\b') {
            $cls = $cls.Trim() + ' font-semibold'
        } else {
            $cls = $cls.Trim()
        }
        
        $m.Groups[1].Value + $cls + $m.Groups[3].Value
    })
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Updated H2-H6 to SemiBold."
