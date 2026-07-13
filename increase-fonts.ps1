$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Only target the feature cards block
$blockStart = '<div class="grid grid-cols-1 sm:grid-cols-2 gap-6 animate-fade-up delay-200 w-full">'
$blockEnd = '<!-- Card 4: Career Ready -->'
$startIndex = $content.IndexOf($blockStart)

if ($startIndex -ge 0) {
    # Replace title size
    $content = $content -replace 'text-\[18px\] text-\[#111111\] font-display font-semibold', 'text-[22px] text-[#111111] font-display font-semibold'
    
    # Replace description size
    $content = $content -replace 'text-\[14px\] text-\[#777777\] font-sans font-normal', 'text-[16px] text-[#777777] font-sans font-normal'
}

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Increased font sizes."
