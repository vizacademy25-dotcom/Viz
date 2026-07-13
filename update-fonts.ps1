$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = Get-Content -Raw $file
    
    # 1. Replace font-display with font-sans
    $content = $content -replace 'font-display', 'font-sans'
    
    # 2. H1: replace any existing font-weight with font-black
    $content = [regex]::Replace($content, '(<h1[^>]*class="[^"]*)(font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-black$3')
    
    # 3. H2: replace with font-extrabold
    $content = [regex]::Replace($content, '(<h2[^>]*class="[^"]*)(font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-extrabold$3')
    
    # 4. H3: replace with font-bold
    $content = [regex]::Replace($content, '(<h3[^>]*class="[^"]*)(font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-bold$3')
    
    # 5. Buttons and Links: replace with font-semibold
    $content = [regex]::Replace($content, '(<a[^>]*class="[^"]*)(font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-semibold$3')
    $content = [regex]::Replace($content, '(<button[^>]*class="[^"]*)(font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-semibold$3')
    
    # 6. Body text (p, span): remove heavier weights
    $content = [regex]::Replace($content, '(<p[^>]*class="[^"]*)(?:\s+font-(?:medium|semibold|bold|extrabold|black))([^"]*")', '$1$2')
    $content = [regex]::Replace($content, '(<span[^>]*class="[^"]*)(?:\s+font-(?:medium|semibold|bold|extrabold|black))([^"]*")', '$1$2')
    
    # Add font-black to h1 if missing
    $content = [regex]::Replace($content, '(<h1[^>]*class=")(?!.*font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-black $2')
    # Add font-extrabold to h2 if missing
    $content = [regex]::Replace($content, '(<h2[^>]*class=")(?!.*font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-extrabold $2')
    # Add font-bold to h3 if missing
    $content = [regex]::Replace($content, '(<h3[^>]*class=")(?!.*font-(?:thin|extralight|light|normal|medium|semibold|bold|extrabold|black))([^"]*")', '$1font-bold $2')
    
    Set-Content -Path $file -Value $content -Encoding UTF8
    Write-Host "Updated $file"
}
