$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Replace Title font size
$content = $content -replace 'text-\[35px\]', 'text-[42px]'

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Updated card titles to 42px."
