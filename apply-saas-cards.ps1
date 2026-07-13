$file = "index.html"
$content = [System.IO.File]::ReadAllText("$pwd\$file", [System.Text.Encoding]::UTF8)

# The exact HTML based on the new SaaS specification
$newGrid = @"
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-[32px] sm:gap-[40px] animate-fade-up delay-200 w-full">
                    
                    <!-- Card 1: Expert Mentors -->
                    <div class="bg-[#FFFFFF] rounded-[24px] border border-[#F2F2F2] shadow-[0_12px_40px_rgba(0,0,0,0.06)] p-[40px] transition-all duration-300 hover:-translate-y-[6px] hover:shadow-[0_20px_50px_rgba(0,0,0,0.1)] flex flex-col items-start text-left h-full">
                        <div class="w-[56px] h-[56px] shrink-0 rounded-full border border-[#FFD8C5] bg-[#FFF5F0] flex items-center justify-center">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1.3.5 2.6 1.5 3.5.8.8 1.3 1.5 1.5 2.5"/><path d="M9 18h6"/><path d="M10 22h4"/></svg>
                        </div>
                        <h3 class="text-[30px] text-[#111111] font-display font-semibold mt-[28px] leading-tight m-0">Expert Mentors</h3>
                        <p class="text-[18px] text-[#6B7280] font-sans font-normal leading-[1.7] mt-[12px] m-0 max-w-[280px]">Learn from industry professionals.</p>
                    </div>

                    <!-- Card 2: Hands-on Projects -->
                    <div class="bg-[#FFFFFF] rounded-[24px] border border-[#F2F2F2] shadow-[0_12px_40px_rgba(0,0,0,0.06)] p-[40px] transition-all duration-300 hover:-translate-y-[6px] hover:shadow-[0_20px_50px_rgba(0,0,0,0.1)] flex flex-col items-start text-left h-full">
                        <div class="w-[56px] h-[56px] shrink-0 rounded-full border border-[#FFD8C5] bg-[#FFF5F0] flex items-center justify-center">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4.5 16.5c-1.5 1.26-2 5-2 5s3.74-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z"/><path d="m12 15-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z"/><path d="M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0"/><path d="M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5"/></svg>
                        </div>
                        <h3 class="text-[30px] text-[#111111] font-display font-semibold mt-[28px] leading-tight m-0">Hands-on Projects</h3>
                        <p class="text-[18px] text-[#6B7280] font-sans font-normal leading-[1.7] mt-[12px] m-0 max-w-[280px]">Build practical experience.</p>
                    </div>

                    <!-- Card 3: One-to-One -->
                    <div class="bg-[#FFFFFF] rounded-[24px] border border-[#F2F2F2] shadow-[0_12px_40px_rgba(0,0,0,0.06)] p-[40px] transition-all duration-300 hover:-translate-y-[6px] hover:shadow-[0_20px_50px_rgba(0,0,0,0.1)] flex flex-col items-start text-left h-full">
                        <div class="w-[56px] h-[56px] shrink-0 rounded-full border border-[#FFD8C5] bg-[#FFF5F0] flex items-center justify-center">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                        </div>
                        <h3 class="text-[30px] text-[#111111] font-display font-semibold mt-[28px] leading-tight m-0">One-to-One</h3>
                        <p class="text-[18px] text-[#6B7280] font-sans font-normal leading-[1.7] mt-[12px] m-0 max-w-[280px]">Personalized guidance.</p>
                    </div>

                    <!-- Card 4: Career Ready -->
                    <div class="bg-[#FFFFFF] rounded-[24px] border border-[#F2F2F2] shadow-[0_12px_40px_rgba(0,0,0,0.06)] p-[40px] transition-all duration-300 hover:-translate-y-[6px] hover:shadow-[0_20px_50px_rgba(0,0,0,0.1)] flex flex-col items-start text-left h-full">
                        <div class="w-[56px] h-[56px] shrink-0 rounded-full border border-[#FFD8C5] bg-[#FFF5F0] flex items-center justify-center">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#FF5A1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg>
                        </div>
                        <h3 class="text-[30px] text-[#111111] font-display font-semibold mt-[28px] leading-tight m-0">Career Ready</h3>
                        <p class="text-[18px] text-[#6B7280] font-sans font-normal leading-[1.7] mt-[12px] m-0 max-w-[280px]">Gain skills for opportunities.</p>
                    </div>

                </div>
"@

$content = [regex]::Replace($content, '(?s)<div class="grid grid-cols-1 sm:grid-cols-2 gap-.*?>.*?<!-- Card 4: Career Ready -->.*?</div>.*?</div>', $newGrid)

[System.IO.File]::WriteAllText("$pwd\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host "Applied SaaS card layout."
