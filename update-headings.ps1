$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # 1. H1 and H2 -> ExtraBold (replace font-bold with font-extrabold)
    $content = [regex]::Replace($content, '(<h[12][^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-bold\b', 'font-extrabold'
        $m.Groups[1].Value + $cls + $m.Groups[3].Value
    })
    
    # 2. H3 to H6 -> Regular (remove font-semibold and font-bold, add font-normal)
    $content = [regex]::Replace($content, '(<h[3-6][^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-(semibold|bold)\b', ''
        if ($cls -notmatch '\bfont-normal\b') {
            $cls = $cls.Trim() + ' font-normal'
        }
        $m.Groups[1].Value + $cls + $m.Groups[3].Value
    })
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Updated heading weights to ExtraBold and Regular."
