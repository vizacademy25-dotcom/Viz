$file = "course-details.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# 1. Hero H1: Poppins 800 (font-extrabold), add tracking-tight if not present
# It already has leading-tight
$content = [regex]::Replace($content, '(<h1[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value
    if ($cls -notmatch 'tracking-tight') { $cls += ' tracking-tight' }
    $m.Groups[1].Value + $cls + $m.Groups[3].Value
})

# 2. Section Headings (h2): Poppins 700 (font-bold), add tracking-tight
$content = [regex]::Replace($content, '(<h2[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value
    if ($cls -notmatch 'tracking-tight') { $cls += ' tracking-tight' }
    if ($cls -notmatch 'leading-tight') { $cls += ' leading-tight' }
    $m.Groups[1].Value + $cls + $m.Groups[3].Value
})

# 3. Card Titles (h3): Poppins 600 (font-semibold), add tracking-tight
$content = [regex]::Replace($content, '(<h3[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value
    if ($cls -notmatch 'tracking-tight') { $cls += ' tracking-tight' }
    $m.Groups[1].Value + $cls + $m.Groups[3].Value
})

# 4. Course Price & Duration: Poppins 700
# Target hero-price and hero-duration
$content = [regex]::Replace($content, '(<p id="hero-price"[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value -replace '\bfont-\w+\b', ''
    $m.Groups[1].Value + $cls + ' font-bold' + $m.Groups[3].Value
})
$content = [regex]::Replace($content, '(<p id="hero-duration"[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value -replace '\bfont-\w+\b', ''
    $m.Groups[1].Value + $cls + ' font-bold' + $m.Groups[3].Value
})
# Target overview-duration
$content = [regex]::Replace($content, '(<span id="overview-duration"[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value -replace '\bfont-\w+\b', ''
    $m.Groups[1].Value + $cls + ' font-bold' + $m.Groups[3].Value
})
# Target dynamic prices in the similar courses section (if any)
# We look for text-[16px] or text-2xl which represent prices and duration, but the previous script already set most of this.

# 5. Labels and Small Text: 300-400, tracking-wider
# Target text-xs or text-sm uppercase labels
$content = [regex]::Replace($content, '(<p[^>]*class="[^"]*text-xs[^"]*uppercase[^"]*)(")', {
    param($m)
    $cls = $m.Groups[1].Value
    if ($cls -notmatch 'font-') { $cls += ' font-light tracking-widest' }
    $cls + $m.Groups[2].Value
})

# 6. Body Text: Ensure leading-relaxed is present for paragraphs
$content = [regex]::Replace($content, '(<p(?![^>]*id="hero-(price|duration)")[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value
    if ($cls -notmatch 'leading-' -and $cls -notmatch 'text-xs') { $cls += ' leading-relaxed' }
    $m.Groups[1].Value + $cls + $m.Groups[3].Value
})

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
Write-Host "Typography refined on course-details.html"
