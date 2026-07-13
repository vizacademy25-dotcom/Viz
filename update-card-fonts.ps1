$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Replace Title font size and weight
$content = $content -replace 'text-\[22px\] text-\[#111111\] font-display font-semibold', 'text-[30px] text-[#111111] font-display font-bold'

# Replace Description font size (from 16px down to 14px)
$content = $content -replace 'text-\[16px\] text-\[#777777\] font-sans font-normal', 'text-[14px] text-[#777777] font-sans font-normal'

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Updated fonts to 30px bold and 14px."
