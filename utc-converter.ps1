# ================================================================================
# UTC Converter Utility
# Converts local times to UTC for flight tracking
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
}

function To-UtcString($dt, [int]$offsetHours) {
    $utc = $dt.AddHours(-$offsetHours)
    return $utc.ToString("yyyy-MM-dd HH:mm") + " UTC"
}

function DT($year,$month,$day,$hour,$min) {
    [datetime]::SpecifyKind(
        (Get-Date -Year $year -Month $month -Day $day -Hour $hour -Minute $min -Second 0),
        'Unspecified'
    )
}

# Define flights
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

# Timezone offset mappings
$tzOffsets = @{
    "PDT" = -7
    "JST" = +9
    "WIB" = +7
}

Write-Host ("="*80) -ForegroundColor Yellow
Write-Host "                       FLIGHT TIMES WITH UTC CONVERSIONS" -ForegroundColor Cyan
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host ""

foreach ($flight in $flights) {
    Write-Host "$($flight.Number) — $($flight.Route)" -ForegroundColor Cyan
    Write-Host ("-" * 80) -ForegroundColor DarkGray

    $depOffset = $tzOffsets[$flight.DepTz]
    $arrOffset = $tzOffsets[$flight.ArrTz]

    $depUtc = To-UtcString $flight.Departure $depOffset
    $arrUtc = To-UtcString $flight.Arrival   $arrOffset

    Write-Host ("Local Departure : {0} {1}" -f $flight.Departure.ToString("yyyy-MM-dd HH:mm"), $flight.DepTz) -ForegroundColor Green
    Write-Host ("Departure (UTC) : {0}" -f $depUtc) -ForegroundColor DarkGreen
    Write-Host ("Local Arrival   : {0} {1}" -f $flight.Arrival.ToString("yyyy-MM-dd HH:mm"), $flight.ArrTz) -ForegroundColor Yellow
    Write-Host ("Arrival (UTC)   : {0}" -f $arrUtc) -ForegroundColor DarkYellow
    Write-Host ("Duration        : {0:hh}h {0:mm}m" -f $flight.Duration) -ForegroundColor White
    Write-Host ("Seats           : {0}" -f $flight.Seats) -ForegroundColor Magenta
    Write-Host ""
}

Write-Host ("="*80) -ForegroundColor Yellow
