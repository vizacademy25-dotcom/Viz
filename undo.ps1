$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = Get-Content -Raw $file
    
    # 1. Replace font-sans with font-display (where it makes sense, usually headings. Tailwind default is sans anyway)
    $content = $content -replace 'font-sans', 'font-display'
    
    # 2. Revert font-black in H1 to font-bold (or just remove if it wasn't there, but bold is safer)
    $content = [regex]::Replace($content, '(<h1[^>]*class="[^"]*)font-black([^"]*")', '$1font-bold$2')
    
    # 3. Revert font-extrabold in H2 to font-bold
    $content = [regex]::Replace($content, '(<h2[^>]*class="[^"]*)font-extrabold([^"]*")', '$1font-bold$2')
    
    # We'll leave H3, buttons and nav as they are (font-bold and font-semibold are very standard)
    
    Set-Content -Path $file -Value $content -Encoding UTF8
    Write-Host "Reverted classes in $file"
}
