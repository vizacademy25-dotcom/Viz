$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# The new HTML for the grid of feature cards
$newGrid = @"
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 animate-fade-up delay-200 w-full">
                    
                    <!-- Card 1: Expert Mentors -->
                    <div class="feature-card p-[32px] sm:p-[40px] group bg-white rounded-[24px] border border-gray-100 shadow-[0_8px_30px_rgb(0,0,0,0.04)] flex flex-col justify-center items-start gap-6 h-full">
                        <div class="w-14 h-14 shrink-0 rounded-full border border-viz-orange/20 bg-viz-orange/5 flex items-center justify-center transition-colors duration-300 group-hover:bg-viz-orange/10 group-hover:border-viz-orange/30">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1.3.5 2.6 1.5 3.5.8.8 1.3 1.5 1.5 2.5"/><path d="M9 18h6"/><path d="M10 22h4"/></svg>
                        </div>
                        <h3 class="text-[28px] text-[#111111] font-display font-semibold leading-tight">Expert Mentors</h3>
                        <p class="text-[18px] text-[#777777] font-sans font-normal leading-[1.6]">Learn from industry professionals.</p>
                    </div>

                    <!-- Card 2: Hands-on Projects -->
                    <div class="feature-card p-[32px] sm:p-[40px] group bg-white rounded-[24px] border border-gray-100 shadow-[0_8px_30px_rgb(0,0,0,0.04)] flex flex-col justify-center items-start gap-6 h-full">
                        <div class="w-14 h-14 shrink-0 rounded-full border border-viz-orange/20 bg-viz-orange/5 flex items-center justify-center transition-colors duration-300 group-hover:bg-viz-orange/10 group-hover:border-viz-orange/30">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"/><path d="m12 15-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"/><path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"/><path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"/></svg>
                        </div>
                        <h3 class="text-[28px] text-[#111111] font-display font-semibold leading-tight">Hands-on Projects</h3>
                        <p class="text-[18px] text-[#777777] font-sans font-normal leading-[1.6]">Build practical experience.</p>
                    </div>

                    <!-- Card 3: One-to-One -->
                    <div class="feature-card p-[32px] sm:p-[40px] group bg-white rounded-[24px] border border-gray-100 shadow-[0_8px_30px_rgb(0,0,0,0.04)] flex flex-col justify-center items-start gap-6 h-full">
                        <div class="w-14 h-14 shrink-0 rounded-full border border-viz-orange/20 bg-viz-orange/5 flex items-center justify-center transition-colors duration-300 group-hover:bg-viz-orange/10 group-hover:border-viz-orange/30">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                        </div>
                        <h3 class="text-[28px] text-[#111111] font-display font-semibold leading-tight">One-to-One</h3>
                        <p class="text-[18px] text-[#777777] font-sans font-normal leading-[1.6]">Personalized guidance.</p>
                    </div>

                    <!-- Card 4: Career Ready -->
                    <div class="feature-card p-[32px] sm:p-[40px] group bg-white rounded-[24px] border border-gray-100 shadow-[0_8px_30px_rgb(0,0,0,0.04)] flex flex-col justify-center items-start gap-6 h-full">
                        <div class="w-14 h-14 shrink-0 rounded-full border border-viz-orange/20 bg-viz-orange/5 flex items-center justify-center transition-colors duration-300 group-hover:bg-viz-orange/10 group-hover:border-viz-orange/30">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg>
                        </div>
                        <h3 class="text-[28px] text-[#111111] font-display font-semibold leading-tight">Career Ready</h3>
                        <p class="text-[18px] text-[#777777] font-sans font-normal leading-[1.6]">Gain skills for opportunities.</p>
                    </div>

                </div>
"@

# Replace the old grid block. We can regex match from `<div class="grid grid-cols-1 sm:grid-cols-2 gap-6 animate-fade-up delay-200 w-full">` to `</div>` after Card 4.
$content = [regex]::Replace($content, '(?s)<div class="grid grid-cols-1 sm:grid-cols-2 gap-6 animate-fade-up delay-200 w-full">.*?<!-- Card 4: Career Ready -->.*?</div>.*?</div>', $newGrid)

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Redesigned feature cards."
