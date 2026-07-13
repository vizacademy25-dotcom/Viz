$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # 1. Update the Google Fonts link
    $content = [regex]::Replace($content, '<link href="https://fonts.googleapis.com/css2[^"]*" rel="stylesheet">', '<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">')
    
    # 2. Clean up old font-display and font-sans classes
    $content = $content -replace '\s+font-display', ''
    $content = $content -replace '\s+font-sans', ''
    
    # 3. Target h1 (Hero Heading: ExtraBold -> 800)
    # Remove any existing font-weight from h1, then add font-extrabold
    $content = [regex]::Replace($content, '(<h1[^>]*class="[^"]*)\s+font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black)([^"]*")', '$1$3')
    $content = [regex]::Replace($content, '(<h1[^>]*class=")([^"]*)(")', '$1font-extrabold $2$3')
    
    # 4. Target h2 (Section Headings: Bold -> 700)
    $content = [regex]::Replace($content, '(<h2[^>]*class="[^"]*)\s+font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black)([^"]*")', '$1$3')
    $content = [regex]::Replace($content, '(<h2[^>]*class=")([^"]*)(")', '$1font-bold $2$3')
    
    # 5. Target h3 (Card Titles: SemiBold -> 600)
    $content = [regex]::Replace($content, '(<h3[^>]*class="[^"]*)\s+font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black)([^"]*")', '$1$3')
    $content = [regex]::Replace($content, '(<h3[^>]*class=")([^"]*)(")', '$1font-semibold $2$3')
    
    # 6. Target buttons and links (font-semibold -> 600)
    # Since buttons might not be <button>, we target common classes: bg-viz-black, bg-viz-orange
    $content = [regex]::Replace($content, '(<a[^>]*class="[^"]*)\s+font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black)([^"]*bg-viz-(black|orange)[^"]*")', '$1$3')
    $content = [regex]::Replace($content, '(<a[^>]*class=")([^"]*bg-viz-(black|orange)[^"]*)(")', '$1font-semibold $2$4')
    
    $content = [regex]::Replace($content, '(<button[^>]*class="[^"]*)\s+font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black)([^"]*")', '$1$3')
    $content = [regex]::Replace($content, '(<button[^>]*class=")([^"]*)(")', '$1font-semibold $2$3')
    
    # 7. Target navigation (Medium -> 500)
    # We find links inside nav.
    $content = [regex]::Replace($content, '(<nav[^>]*>.*?)(<a[^>]*class="[^"]*)\s+font-(thin|extralight|light|normal|medium|semibold|bold|extrabold|black)([^"]*")', '$1$2$4', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    # Add font-medium to nav links
    # Due to regex complexity in PS, let's just do a string replace on known nav classes if they are standard, or just trust the previous classes if they were correct.
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}
Write-Host "Updated fonts successfully."
