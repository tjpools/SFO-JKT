# ================================================================================
# Modular Flight Leg Class
# Reusable flight object model for tracking individual flight segments
# ================================================================================

class FlightLeg {
    [string]$Number
    [string]$From
    [string]$To
    [datetime]$DepLocal
    [string]$DepTz
    [datetime]$ArrLocal
    [string]$ArrTz
    [timespan]$Duration
    [string]$Seats

    FlightLeg([string]$num,[string]$from,[string]$to,
              [datetime]$dep,[string]$depTz,
              [datetime]$arr,[string]$arrTz,
              [timespan]$dur,[string]$seats) {
        $this.Number  = $num
        $this.From    = $from
        $this.To      = $to
        $this.DepLocal= $dep
        $this.DepTz   = $depTz
        $this.ArrLocal= $arr
        $this.ArrTz   = $arrTz
        $this.Duration= $dur
        $this.Seats   = $seats
    }

    [string]ToString() {
        return "{0}: {1} → {2} | {3} {4} → {5} {6} | {7:hh}h{7:mm}m | {8}" -f `
            $this.Number,$this.From,$this.To,
            $this.DepLocal.ToString("MMM dd HH:mm"),$this.DepTz,
            $this.ArrLocal.ToString("MMM dd HH:mm"),$this.ArrTz,
            $this.Duration,$this.Seats
    }

    [void]PrintDetailed() {
        Write-Host ("{0}: {1} → {2}" -f $this.Number, $this.From, $this.To) -ForegroundColor Cyan
        Write-Host ("-" * 70) -ForegroundColor DarkGray
        Write-Host ("  Departure: {0} {1}" -f $this.DepLocal.ToString("MMM dd, yyyy HH:mm"), $this.DepTz) -ForegroundColor Green
        Write-Host ("  Arrival  : {0} {1}" -f $this.ArrLocal.ToString("MMM dd, yyyy HH:mm"), $this.ArrTz) -ForegroundColor Yellow
        Write-Host ("  Duration : {0:hh}h {0:mm}m" -f $this.Duration) -ForegroundColor White
        Write-Host ("  Seats    : {0}" -f $this.Seats) -ForegroundColor Magenta
        Write-Host ""
    }

    [hashtable]ToHashtable() {
        return @{
            Number    = $this.Number
            From      = $this.From
            To        = $this.To
            Departure = $this.DepLocal
            DepTz     = $this.DepTz
            Arrival   = $this.ArrLocal
            ArrTz     = $this.ArrTz
            Duration  = $this.Duration.ToString()
            Seats     = $this.Seats
        }
    }
}

# Helper to build DateTime quickly
function DT($year,$month,$day,$hour,$min) {
    [datetime]::SpecifyKind(
        (Get-Date -Year $year -Month $month -Day $day -Hour $hour -Minute $min -Second 0),
        'Unspecified'
    )
}

# Create flight legs
$legs = @(
    [FlightLeg]::new("ANA 107","SFO","HND",
                     (DT 2026 7 2 1 40),"PDT",
                     (DT 2026 7 3 4 25),"JST",
                     ([timespan]::FromMinutes(10*60+45)),"34A, 34C"),

    [FlightLeg]::new("ANA 855","HND","CGK",
                     (DT 2026 7 3 10 15),"JST",
                     (DT 2026 7 3 16 0),"WIB",
                     ([timespan]::FromMinutes(7*60+45)),"21A, 21B"),

    [FlightLeg]::new("ANA 856","CGK","HND",
                     (DT 2026 7 19 21 25),"WIB",
                     (DT 2026 7 20 6 50),"JST",
                     ([timespan]::FromMinutes(7*60+25)),"21A, 21B"),

    [FlightLeg]::new("ANA 108","HND","SFO",
                     (DT 2026 7 20 22 55),"JST",
                     (DT 2026 7 20 16 55),"PDT",
                     ([timespan]::FromMinutes(11*60)),"32A, 32C")
)

Write-Host ("="*80) -ForegroundColor Yellow
Write-Host "                         MODULAR FLIGHT LEG TRACKER" -ForegroundColor Cyan
Write-Host ("="*80) -ForegroundColor Yellow
Write-Host ""

Write-Host "COMPACT VIEW:" -ForegroundColor Green
Write-Host ("-" * 80) -ForegroundColor DarkGray
$legs | ForEach-Object { 
    Write-Host $_.ToString() -ForegroundColor White
}
Write-Host ""

Write-Host "DETAILED VIEW:" -ForegroundColor Green
Write-Host ("-" * 80) -ForegroundColor DarkGray
$legs | ForEach-Object { 
    $_.PrintDetailed()
}

Write-Host ("="*80) -ForegroundColor Yellow

# Export example
Write-Host "Exporting to CSV..." -ForegroundColor Cyan
$legs | ForEach-Object { [PSCustomObject]$_.ToHashtable() } | 
    Export-Csv -Path "flights.csv" -NoTypeInformation
Write-Host "✓ Exported to flights.csv" -ForegroundColor Green
