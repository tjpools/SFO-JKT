# ================================================================================
# Flight Tracker with Schedule Delta Tracking
# Shows early/late arrivals compared to scheduled times
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

class TimedFlight : Flight {
    [datetime]$ScheduledArrival
    [timespan]$ArrivalDelta

    TimedFlight([string]$n,[string]$r,[datetime]$d,[string]$dtz,
                [datetime]$schedArr,[datetime]$actArr,[string]$atz,
                [timespan]$dur,[string]$s,[string]$st) :
        base($n,$r,$d,$dtz,$actArr,$atz,$dur,$s,$st) {

        $this.ScheduledArrival = $schedArr
        $this.ArrivalDelta     = $actArr - $schedArr
    }

    [void]PrintWithDelta() {
        Write-Host "FLIGHT $($this.Number) — $($this.Route)" -ForegroundColor Cyan
        Write-Host ("-" * 80) -ForegroundColor DarkGray
        Write-Host ("Departure        : {0} {1}" -f $this.Departure, $this.DepTz) -ForegroundColor Green
        Write-Host ("Scheduled Arrival: {0} {1}" -f $this.ScheduledArrival, $this.ArrTz) -ForegroundColor Yellow
        Write-Host ("Actual Arrival   : {0} {1}" -f $this.Arrival, $this.ArrTz) -ForegroundColor Yellow
        Write-Host ("Duration         : {0:hh}h {0:mm}m" -f $this.Duration) -ForegroundColor White
        Write-Host ("Seats            : {0}" -f $this.Seats) -ForegroundColor Magenta

        $delta = $this.ArrivalDelta
        $sign  = if ($delta.TotalMinutes -ge 0) { "+" } else { "-" }
        $mins  = [math]::Abs([int]$delta.TotalMinutes)

        $deltaColor = if ($delta.TotalMinutes -lt 0) { "Green" } else { "Red" }
        Write-Host ("Schedule Δ       : {0}{1} min" -f $sign,$mins) -ForegroundColor $deltaColor
        Write-Host ("Status           : {0}" -f $this.Status) -ForegroundColor Green
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

# Display header
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host "                    FLIGHT TRACKER WITH SCHEDULE TRACKING" -ForegroundColor Cyan
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host ""

# Example: ANA 107 scheduled 04:35, actually arrived 04:25 (10 min early)
$ana107 = [TimedFlight]::new(
    "ANA 107","SFO → HND",
    (DT 2026 7 2 1 40),"PDT",
    (DT 2026 7 3 4 35),  # scheduled
    (DT 2026 7 3 4 25),  # actual
    "JST",
    ([timespan]::FromMinutes(10*60+45)),
    "34A, 34C","✓ Arrived"
)

# ANA 855 scheduled 16:00, actually arrived 16:15 (15 min late)
$ana855 = [TimedFlight]::new(
    "ANA 855","HND → CGK",
    (DT 2026 7 3 10 15),"JST",
    (DT 2026 7 3 16 0),   # scheduled
    (DT 2026 7 3 16 15),  # actual (late)
    "WIB",
    ([timespan]::FromMinutes(7*60+45)),
    "21A, 21B","✓ Arrived"
)

# ANA 856 on time
$ana856 = [TimedFlight]::new(
    "ANA 856","CGK → HND",
    (DT 2026 7 19 21 25),"WIB",
    (DT 2026 7 20 6 50),  # scheduled
    (DT 2026 7 20 6 50),  # actual (on time)
    "JST",
    ([timespan]::FromMinutes(7*60+25)),
    "21A, 21B","✓ Arrived"
)

# ANA 108 scheduled 16:55, actually arrived 16:40 (15 min early)
$ana108 = [TimedFlight]::new(
    "ANA 108","HND → SFO",
    (DT 2026 7 20 22 55),"JST",
    (DT 2026 7 20 16 55), # scheduled
    (DT 2026 7 20 16 40), # actual (early)
    "PDT",
    ([timespan]::FromMinutes(11*60)),
    "32A, 32C","✓ Arrived"
)

$ana107.PrintWithDelta()
$ana855.PrintWithDelta()
$ana856.PrintWithDelta()
$ana108.PrintWithDelta()

Write-Host ("="*80) -ForegroundColor Yellow
