$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = Get-Content -Raw $file
    
    # 1. Remove font-display and font-sans everywhere first to reset
    $content = $content -replace '\s+font-display', ''
    $content = $content -replace '\s+font-sans', ''
    
    # 2. Add font-display to h1 and h2
    $content = [regex]::Replace($content, '(<h1[^>]*class=")([^"]*)(")', '$1font-display $2$3')
    $content = [regex]::Replace($content, '(<h2[^>]*class=")([^"]*)(")', '$1font-display $2$3')
    
    # 3. Add font-sans to h3, p, span, a, button, just to be strictly compliant with "use font-sans for everything else", though typically it's inherited.
    # Actually, adding font-sans to every single element is bloated and bad practice.
    # Instead, we just let tailwind inherit it via the body (which already uses sans by default), or we can add it to the body tag.
    $content = [regex]::Replace($content, '(<body[^>]*class=")([^"]*)(")', '$1font-sans $2$3')
    # Let's also add it to elements that might be explicitly styled
    
    # 4. Clean up any rogue weights from our Poppins experiment
    # For h1, we leave font-black (900) or font-extrabold (800) because Poppins supports them.
    # For others, max weight is 800 (font-extrabold). If there is font-black on h3, nav, or p, we downgrade it to font-extrabold.
    $content = [regex]::Replace($content, '(<h3[^>]*class="[^"]*)font-black([^"]*")', '$1font-extrabold$2')
    $content = [regex]::Replace($content, '(<p[^>]*class="[^"]*)font-black([^"]*")', '$1font-bold$2')
    $content = [regex]::Replace($content, '(<a[^>]*class="[^"]*)font-black([^"]*")', '$1font-bold$2')
    $content = [regex]::Replace($content, '(<button[^>]*class="[^"]*)font-black([^"]*")', '$1font-bold$2')
    
    Set-Content -Path $file -Value $content -Encoding UTF8
    Write-Host "Restored typography in $file"
}
