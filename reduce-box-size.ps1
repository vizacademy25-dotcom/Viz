$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Reduce the grid max-width and gap
$content = $content -replace 'max-w-\[800px\] mx-auto', 'max-w-[680px] mx-auto'
$content = $content -replace 'gap-8 animate-fade-up', 'gap-6 animate-fade-up'

# Reduce the card padding
$content = $content -replace 'p-\[36px\] shadow', 'p-[28px] shadow'

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Reduced overall box size."
