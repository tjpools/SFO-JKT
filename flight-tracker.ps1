# ================================================================================
# Flight Tracker - PowerShell Version
# Dynamic flight itinerary display with timezone information
# ================================================================================

class Flight {
    [string]$Number
    [string]$Route
    [datetime]$Departure
    [string]$DepTz
    [datetime]$Arrival
    [string]$ArrTz
    [timespan]$Duration
    [string]$Seats
    [string]$Status

    Flight([string]$n,[string]$r,[datetime]$d,[string]$dtz,
           [datetime]$a,[string]$atz,[timespan]$dur,[string]$s,[string]$st) {
        $this.Number   = $n
        $this.Route    = $r
        $this.Departure= $d
        $this.DepTz    = $dtz
        $this.Arrival  = $a
        $this.ArrTz    = $atz
        $this.Duration = $dur
        $this.Seats    = $s
        $this.Status   = $st
    }

    [void]PrintDetail() {
        Write-Host "FLIGHT $($this.Number) — $($this.Route)" -ForegroundColor Cyan
        Write-Host ("-" * 80) -ForegroundColor DarkGray
        Write-Host ("Departure : {0} {1}" -f $this.Departure, $this.DepTz) -ForegroundColor Green
        Write-Host ("Arrival   : {0} {1}" -f $this.Arrival,   $this.ArrTz) -ForegroundColor Yellow
        Write-Host ("Duration  : {0:hh}h {0:mm}m" -f $this.Duration) -ForegroundColor White
        Write-Host ("Seats     : {0}" -f $this.Seats) -ForegroundColor Magenta
        Write-Host ("Status    : {0}" -f $this.Status) -ForegroundColor Green
        Write-Host ""
    }
}

# Helper to build DateTime quickly
function DT($year,$month,$day,$hour,$min) {
    [datetime]::SpecifyKind(
        (Get-Date -Year $year -Month $month -Day $day -Hour $hour -Minute $min -Second 0),
        'Unspecified'
    )
}

# Define all flights
$flights = @(
    [Flight]::new("ANA 107","SFO → HND",
        (DT 2026 7 2 1 40),"PDT",
        (DT 2026 7 3 4 25),"JST",
        ([timespan]::FromMinutes(10*60+45)),
        "34A, 34C","✓ Arrived"),

    [Flight]::new("ANA 855","HND → CGK",
        (DT 2026 7 3 10 15),"JST",
        (DT 2026 7 3 16 0),"WIB",
        ([timespan]::FromMinutes(7*60+45)),
        "21A, 21B","✓ Arrived"),

    [Flight]::new("ANA 856","CGK → HND",
        (DT 2026 7 19 21 25),"WIB",
        (DT 2026 7 20 6 50),"JST",
        ([timespan]::FromMinutes(7*60+25)),
        "21A, 21B","✓ Arrived"),

    [Flight]::new("ANA 108","HND → SFO",
        (DT 2026 7 20 22 55),"JST",
        (DT 2026 7 20 16 55),"PDT",
        ([timespan]::FromMinutes(11*60)),
        "32A, 32C","✓ Arrived")
)

# Display header
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host "                           FLIGHT TRACKER APPLICATION" -ForegroundColor Cyan
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host ""

# Print each flight
foreach ($f in $flights) {
    $f.PrintDetail()
}

# Display route map
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host "                              ROUTE VISUALIZATION" -ForegroundColor Cyan
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host ""
Write-Host "OUTBOUND JOURNEY:" -ForegroundColor Green
Write-Host "  SFO ──(ANA 107)──> HND ──(ANA 855)──> CGK" -ForegroundColor White
Write-Host "  San Francisco      Tokyo              Jakarta" -ForegroundColor DarkGray
Write-Host ""
Write-Host "RETURN JOURNEY:" -ForegroundColor Yellow
Write-Host "  CGK ──(ANA 856)──> HND ──(ANA 108)──> SFO" -ForegroundColor White
Write-Host "  Jakarta            Tokyo              San Francisco" -ForegroundColor DarkGray
Write-Host ""
Write-Host ("="*80) -ForegroundColor Yellow
