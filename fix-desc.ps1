$file = "index.html"
$c = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Replace all remaining instances of the 15px description
$c = $c -replace 'text-\[15px\] text-\[#888888\] font-sans leading-\[1.6\]', 'text-[14px] text-[#888888] font-sans leading-relaxed'

[System.IO.File]::WriteAllText("$pwd\$file", $c, [System.Text.Encoding]::UTF8)

Write-Host "Fixed description sizes."
