$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Replace padding
$content = $content -replace 'p-\[32px\] sm:p-\[40px\]', 'p-[20px] sm:p-[24px]'

# Replace border radius
$content = $content -replace 'rounded-\[24px\]', 'rounded-[16px]'

# Replace icon wrapper size
$content = $content -replace 'w-14 h-14', 'w-10 h-10'

# Replace SVG size
# We need to be careful to only replace width="24" height="24" inside the feature cards
# Actually, since we only added them recently, we can just replace it in the cards block.
# Let's match the block
$blockStart = '<div class="grid grid-cols-1 sm:grid-cols-2 gap-6 animate-fade-up delay-200 w-full">'
$blockEnd = '<!-- Card 4: Career Ready -->'
$startIndex = $content.IndexOf($blockStart)

if ($startIndex -ge 0) {
    # It's safer to just replace globally if width="24" height="24" is unique to these SVGs or it doesn't matter much.
    # Let's use regex that targets the specific elements we added:
    $content = $content -replace 'width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F"', 'width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F"'
    
    # Replace spacing
    $content = [regex]::Replace($content, '(<div class="flex flex-col justify-center flex-grow )gap-6 mt-7', '${1}gap-3 mt-4')
    
    # Replace title size
    $content = $content -replace 'text-\[28px\]', 'text-[18px]'
    
    # Replace description size
    $content = $content -replace 'text-\[18px\]', 'text-[14px]'
}

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Reduced card sizes."
