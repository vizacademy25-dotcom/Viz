$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # 1. Revert Google Fonts
    $content = [regex]::Replace($content, '<link href="https://fonts.googleapis.com/css2\?family=Poppins[^"]*" rel="stylesheet">', '<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Poppins:wght@700;800;900&display=swap" rel="stylesheet">')
    
    # 2. Revert Descriptions
    $longDesc1 = "Learn design principles, typography, branding, and visual storytelling. Build a professional portfolio and launch your creative career with industry-standard skills."
    $shortDesc1 = "Learn graphic design from the basics with practical projects and expert guidance."
    $content = $content.Replace($longDesc1, $shortDesc1)
    
    $longDesc2 = "Master professional video editing with industry-standard tools, hands-on projects, and expert guidance."
    $shortDesc2 = "Learn professional video editing through hands-on projects."
    $content = $content.Replace($longDesc2, $shortDesc2)
    
    # 3. Clean up the tracking and specific leading classes added today
    $content = $content -replace '\stracking-tight', ''
    $content = $content -replace '\stracking-widest', ''
    $content = $content -replace '\sfont-light', ''
    # leading-relaxed was added to some p tags that didn't have it, but they are safe to leave, or we can just let it be.
    
    # 4. Revert Typography Classes
    # h1: font-extrabold -> font-display font-black
    $content = [regex]::Replace($content, '(<h1[^>]*class="[^"]*)\sfont-extrabold([^"]*")', '$1 font-display font-black$2')
    # If it was left as font-black but missing font-display:
    $content = [regex]::Replace($content, '(<h1[^>]*class=")(?![^"]*font-display)([^"]*)(")', '$1font-display $2$3')
    
    # h2: font-bold -> font-display font-bold (or extrabold)
    # Actually, original was font-bold or extrabold, let's just make sure it has font-display
    $content = [regex]::Replace($content, '(<h2[^>]*class=")(?![^"]*font-display)([^"]*)(")', '$1font-display $2$3')
    
    # h3: font-semibold -> font-bold
    $content = [regex]::Replace($content, '(<h3[^>]*class="[^"]*)\sfont-semibold([^"]*")', '$1 font-bold$2')
    
    # nav a: font-medium -> font-semibold
    # Look for top nav a tags
    $content = [regex]::Replace($content, '(<nav[^>]*>.*?)(<a[^>]*class="[^"]*)\sfont-medium([^"]*")', '$1$2 font-semibold$3', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    
    # Hero prices were upgraded to font-bold, remove it
    $content = [regex]::Replace($content, '(<p id="hero-price"[^>]*class="[^"]*)\sfont-bold([^"]*")', '$1$2')
    $content = [regex]::Replace($content, '(<p id="hero-duration"[^>]*class="[^"]*)\sfont-bold([^"]*")', '$1$2')
    $content = [regex]::Replace($content, '(<span id="overview-duration"[^>]*class="[^"]*)\sfont-bold([^"]*")', '$1$2')
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Reverted to July 5th state."
