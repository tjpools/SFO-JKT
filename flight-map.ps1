# ========================================
# Flight Route Map - ASCII Visualization
# ========================================

Write-Host ""
Write-Host ("="*80) -ForegroundColor Green
Write-Host "                           FLIGHT ROUTE MAP" -ForegroundColor Yellow
Write-Host ("="*80) -ForegroundColor Green
Write-Host ""

Write-Host "OUTBOUND JOURNEY (July 2-3)" -ForegroundColor Cyan
Write-Host ("-"*80) -ForegroundColor DarkGray
Write-Host ""

Write-Host "          SFO                      HND                          CGK"
Write-Host "          │                        │                            │"
Write-Host "          │  " -NoNewline
Write-Host "ANA 107 (10h 45m)" -ForegroundColor Yellow -NoNewline
Write-Host "      │  " -NoNewline
Write-Host "ANA 855 (7h 45m)" -ForegroundColor Yellow -NoNewline
Write-Host "           │"
Write-Host "          ├──────────────▶         ├──────────────▶             │" -ForegroundColor Green
Write-Host "          │                        │                            │"
Write-Host "   " -NoNewline
Write-Host "San Francisco" -ForegroundColor Cyan -NoNewline
Write-Host "              " -NoNewline
Write-Host "Tokyo Haneda" -ForegroundColor Cyan -NoNewline
Write-Host "                 " -NoNewline
Write-Host "Jakarta" -ForegroundColor Cyan
Write-Host "   Pacific Ocean" -ForegroundColor DarkCyan -NoNewline
Write-Host "             Japan / Tokyo Bay" -ForegroundColor DarkCyan -NoNewline
Write-Host "         Java Sea / Indonesia" -ForegroundColor DarkCyan

Write-Host ""
Write-Host "   Layover in HND: " -NoNewline -ForegroundColor White
Write-Host "5h 50m" -ForegroundColor Magenta
Write-Host ""
Write-Host ""

Write-Host "RETURN JOURNEY (July 19-20)" -ForegroundColor Cyan
Write-Host ("-"*80) -ForegroundColor DarkGray
Write-Host ""

Write-Host "          CGK                      HND                          SFO"
Write-Host "          │                        │                            │"
Write-Host "          │  " -NoNewline
Write-Host "ANA 856 (7h 25m)" -ForegroundColor Yellow -NoNewline
Write-Host "      │  " -NoNewline
Write-Host "ANA 108 (11h 00m)" -ForegroundColor Yellow -NoNewline
Write-Host "          │"
Write-Host "          ├──────────────▶         ├──────────────▶             │" -ForegroundColor Green
Write-Host "          │                        │                            │"
Write-Host "   " -NoNewline
Write-Host "Jakarta" -ForegroundColor Cyan -NoNewline
Write-Host "                    " -NoNewline
Write-Host "Tokyo Haneda" -ForegroundColor Cyan -NoNewline
Write-Host "             " -NoNewline
Write-Host "San Francisco" -ForegroundColor Cyan
Write-Host "   Indonesia / Java" -ForegroundColor DarkCyan -NoNewline
Write-Host "          Japan / Tokyo Bay" -ForegroundColor DarkCyan -NoNewline
Write-Host "         Pacific → California" -ForegroundColor DarkCyan

Write-Host ""
Write-Host "   Layover in HND: " -NoNewline -ForegroundColor White
Write-Host "16h 05m" -ForegroundColor Magenta
Write-Host ""

Write-Host ("="*80) -ForegroundColor Green
Write-Host ""
