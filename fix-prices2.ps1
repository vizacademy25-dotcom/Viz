$files = @("index.html", "course-details.html")
$rupee = [char]0x20B9

foreach ($file in $files) {
    # Read the file
    $content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)
    
    # Fix the prices in JS object (course-details.html)
    $content = [regex]::Replace($content, "price: '[^0-9]*7,499'", "price: '${rupee}7,499'")
    $content = [regex]::Replace($content, "price: '[^0-9]*16,499'", "price: '${rupee}16,499'")
    $content = [regex]::Replace($content, "price: '[^0-9]*28,499'", "price: '${rupee}28,499'")
    
    # Fix the prices in HTML text (both files)
    $content = [regex]::Replace($content, ">[^<0-9]*7,499<", ">${rupee}7,499<")
    $content = [regex]::Replace($content, ">[^<0-9]*16,499<", ">${rupee}16,499<")
    $content = [regex]::Replace($content, ">[^<0-9]*28,499<", ">${rupee}28,499<")
    
    # Write it back explicitly as UTF8
    [System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)
    Write-Host "Fixed prices in $file"
}
