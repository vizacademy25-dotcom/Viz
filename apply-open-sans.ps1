$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # 1. Update Google Fonts
    $content = [regex]::Replace($content, '<link href="https://fonts.googleapis.com/css2\?family=Inter[^"]*" rel="stylesheet">', '<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400&family=Poppins:wght@500;600;700;800&display=swap" rel="stylesheet">')
    
    # 2. Update Headings (H1-H6)
    # H1 -> Poppins Bold
    $content = [regex]::Replace($content, '(<h1[^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-bold' + $m.Groups[3].Value
    })
    
    # H2 -> Poppins Bold
    $content = [regex]::Replace($content, '(<h2[^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-bold' + $m.Groups[3].Value
    })
    
    # H3 -> Poppins SemiBold
    $content = [regex]::Replace($content, '(<h3[^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-semibold' + $m.Groups[3].Value
    })
    
    # 3. Update Navigation Links -> Poppins Medium
    # They are <a> tags inside <nav>
    $content = [regex]::Replace($content, '(<nav[^>]*>.*?)(<a[^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[3].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $m.Groups[2].Value + $cls.Trim() + ' font-display font-medium' + $m.Groups[4].Value
    }, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    
    # 4. Update Buttons -> Poppins Medium
    # Target <button> and <a> tags acting as buttons (e.g. bg-viz-black, bg-viz-orange)
    $content = [regex]::Replace($content, '(<a[^>]*class=")([^"]*bg-viz-(black|orange)[^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-medium' + $m.Groups[4].Value
    })
    
    $content = [regex]::Replace($content, '(<button[^>]*class=")([^"]*)(")', {
        param($m)
        $cls = $m.Groups[2].Value -replace '\bfont-[a-z]+\b', ''
        $m.Groups[1].Value + $cls.Trim() + ' font-display font-medium' + $m.Groups[3].Value
    })
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Typography updated to Open Sans and Poppins."
