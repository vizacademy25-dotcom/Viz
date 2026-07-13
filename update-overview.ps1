$file = "course-details.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# 1. Update hero-duration
$content = [regex]::Replace($content, '(<p id="hero-duration"[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value
    $cls = $cls -replace '\bfont-[a-z]+\b', ''
    $m.Groups[1].Value + $cls.Trim() + ' font-display font-extrabold' + $m.Groups[3].Value
})

# 2. Update overview-duration
$content = [regex]::Replace($content, '(<p id="overview-duration"[^>]*class=")([^"]*)(")', {
    param($m)
    $cls = $m.Groups[2].Value
    $cls = $cls -replace '\bfont-[a-z]+\b', ''
    $m.Groups[1].Value + $cls.Trim() + ' font-display font-extrabold' + $m.Groups[3].Value
})

# 3. Update other overview items
# Find `<p class="text-xl text-viz-black">` and `<p class="text-xl text-[#FF6B00]">`
# But we need to make sure we don't hit other random p tags. Let's just do exact string replacements since there are only 4 of them.

$content = $content -replace '<p class="text-xl text-viz-black">1 Hour</p>', '<p class="text-xl text-viz-black font-display font-extrabold">1 Hour</p>'
$content = $content -replace '<p class="text-xl text-viz-black">Beginner to Pro</p>', '<p class="text-xl text-viz-black font-display font-extrabold">Beginner to Pro</p>'
$content = $content -replace '<p class="text-xl text-viz-black">English / Reg</p>', '<p class="text-xl text-viz-black font-display font-extrabold">English / Reg</p>'
$content = $content -replace '<p class="text-xl text-\[#FF6B00\]">Live Online</p>', '<p class="text-xl text-[#FF6B00] font-display font-extrabold">Live Online</p>'

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
Write-Host "Updated duration and overview items."
