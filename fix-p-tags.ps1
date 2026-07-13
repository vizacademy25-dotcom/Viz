$file = "course-details.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# Fix the broken p tags
$content = [regex]::Replace($content, 'class=" leading-relaxed([^">]+)>', 'class="$1">')

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
Write-Host "Fixed broken p tags in course-details.html"
