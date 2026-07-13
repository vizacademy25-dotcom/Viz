$files = @("index.html", "course-details.html")

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # h1 cleanup
    $content = [regex]::Replace($content, '(<h1[^>]*class="[^"]*)font-display font-extrabold font-sans([^"]*")', '$1font-display font-black$2')
    
    # h2 cleanup if needed
    $content = [regex]::Replace($content, '(<h2[^>]*class="[^"]*)font-display font-bold font-sans([^"]*")', '$1font-display font-bold$2')
    
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Cleanup done."
