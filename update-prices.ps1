$index = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$index", [System.Text.Encoding]::UTF8)

# Increase font size for prices in index.html (from 16px to 20px)
$content = $content -replace 'text-\[16px\](\s+)text-viz-black font-display font-bold', 'text-[20px]$1text-viz-black font-display font-bold'

# Update values
$content = $content -replace '₹7,499', '₹9,999'
$content = $content -replace '₹16,499', '₹19,999'
$content = $content -replace '₹28,499', '₹29,999'

[System.IO.File]::WriteAllText("$pwd\$index", $content, [System.Text.Encoding]::UTF8)

$details = "course-details.html"
$content2 = [System.IO.File]::ReadAllText("$pwd\$details", [System.Text.Encoding]::UTF8)

# Increase font size for hero price in course-details.html
$content2 = $content2 -replace 'class="text-2xl text-viz-black font-display font-bold"', 'class="text-[30px] text-viz-black font-display font-bold"'

# Update values
$content2 = $content2 -replace '₹7,499', '₹9,999'
$content2 = $content2 -replace '₹16,499', '₹19,999'
$content2 = $content2 -replace '₹28,499', '₹29,999'

[System.IO.File]::WriteAllText("$pwd\$details", $content2, [System.Text.Encoding]::UTF8)

Write-Host "Updated prices and font sizes."
