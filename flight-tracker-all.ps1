# ========================================
# ALL-IN-ONE FLIGHT TRACKER
# Comprehensive flight tracking with all features
# ========================================

param(
	[switch]$ShowDelays,
	[switch]$ShowUTC,
	[switch]$ShowMap,
	[switch]$ShowAll
)

class Flight {
	[string]$Number
	[string]$Route
	[datetime]$Departure
	[string]$DepTz
	[int]$DepUtcOffset
	[datetime]$Arrival
	[string]$ArrTz
	[int]$ArrUtcOffset
	[timespan]$Duration
	[string]$Seats
	[datetime]$ScheduledArrival
	[string]$Status

	Flight([string]$n,[string]$r,[datetime]$d,[string]$dtz,[int]$dOff,
		   [datetime]$a,[string]$atz,[int]$aOff,[timespan]$dur,[string]$s,
		   [datetime]$schedArr,[string]$st) {
		$this.Number          = $n
		$this.Route           = $r
		$this.Departure       = $d
		$this.DepTz           = $dtz
		$this.DepUtcOffset    = $dOff
		$this.Arrival         = $a
		$this.ArrTz           = $atz
		$this.ArrUtcOffset    = $aOff
		$this.Duration        = $dur
		$this.Seats           = $s
		$this.ScheduledArrival= $schedArr
		$this.Status          = $st
	}

	[string]GetDepUtc() {
		$utc = $this.Departure.AddHours(-$this.DepUtcOffset)
		return $utc.ToString("yyyy-MM-dd HH:mm") + " UTC"
	}

	[string]GetArrUtc() {
		$utc = $this.Arrival.AddHours(-$this.ArrUtcOffset)
		return $utc.ToString("yyyy-MM-dd HH:mm") + " UTC"
	}

	[timespan]GetDelay() {
		return $this.Arrival - $this.ScheduledArrival
	}

	[void]Print([bool]$showUtc,[bool]$showDelay) {
		Write-Host "FLIGHT $($this.Number) — $($this.Route)" -ForegroundColor Cyan
		Write-Host ("-" * 80) -ForegroundColor DarkGray

		Write-Host ("Departure : {0} {1}" -f $this.Departure, $this.DepTz) -ForegroundColor Green
		if ($showUtc) {
			Write-Host ("            {0}" -f $this.GetDepUtc()) -ForegroundColor DarkGreen
		}

		Write-Host ("Arrival   : {0} {1}" -f $this.Arrival, $this.ArrTz) -ForegroundColor Yellow
		if ($showUtc) {
			Write-Host ("            {0}" -f $this.GetArrUtc()) -ForegroundColor DarkYellow
		}

		if ($showDelay) {
			$delta = $this.GetDelay()
			$sign  = if ($delta.TotalMinutes -ge 0) { "+" } else { "-" }
			$mins  = [math]::Abs([int]$delta.TotalMinutes)
			$color = if ($delta.TotalMinutes -lt 0) { "Green" } elseif ($delta.TotalMinutes -eq 0) { "White" } else { "Red" }
			Write-Host ("Schedule Δ: {0}{1} min" -f $sign,$mins) -ForegroundColor $color
		}

		Write-Host ("Duration  : {0:hh}h {0:mm}m" -f $this.Duration) -ForegroundColor White
		Write-Host ("Seats     : {0}" -f $this.Seats) -ForegroundColor White
		Write-Host ("Status    : {0}" -f $this.Status) -ForegroundColor Magenta
		Write-Host ""
	}
}

function DT($year,$month,$day,$hour,$min) {
	[datetime]::SpecifyKind(
		(Get-Date -Year $year -Month $month -Day $day -Hour $hour -Minute $min -Second 0),
		'Unspecified'
	)
}

function Show-RouteMap {
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
	Write-Host ""
	Write-Host "   Layover in HND: " -NoNewline -ForegroundColor White
	Write-Host "16h 05m" -ForegroundColor Magenta
	Write-Host ""
	Write-Host ("="*80) -ForegroundColor Green
	Write-Host ""
}

# Build flights
$flights = @(
	[Flight]::new("ANA 107","SFO → HND",
		(DT 2026 7 2 1 40),"PDT",-7,
		(DT 2026 7 3 4 25),"JST",9,
		([timespan]::FromMinutes(10*60+45)),
		"34A, 34C",
		(DT 2026 7 3 4 35),"✓ Arrived"),  # 10 min early

	[Flight]::new("ANA 855","HND → CGK",
		(DT 2026 7 3 10 15),"JST",9,
		(DT 2026 7 3 16 15),"WIB",7,
		([timespan]::FromMinutes(7*60+45)),
		"21A, 21B",
		(DT 2026 7 3 16 0),"✓ Arrived"),  # 15 min late

	[Flight]::new("ANA 856","CGK → HND",
		(DT 2026 7 19 21 25),"WIB",7,
		(DT 2026 7 20 6 50),"JST",9,
		([timespan]::FromMinutes(7*60+25)),
		"21A, 21B",
		(DT 2026 7 20 6 50),"✓ Arrived"),  # On time

	[Flight]::new("ANA 108","HND → SFO",
		(DT 2026 7 20 22 55),"JST",9,
		(DT 2026 7 20 16 50),"PDT",-7,
		([timespan]::FromMinutes(11*60)),
		"32A, 32C",
		(DT 2026 7 20 16 55),"✓ Arrived")  # 5 min early
)

# Determine what to show
if ($ShowAll) {
	$ShowDelays = $true
	$ShowUTC = $true
	$ShowMap = $true
}

# Display header
Write-Host ""
Write-Host ("🛫" * 40) -ForegroundColor Yellow
Write-Host "                     COMPREHENSIVE FLIGHT TRACKER" -ForegroundColor Cyan
if ($ShowDelays) { Write-Host "                     [WITH DELAY TRACKING]" -ForegroundColor Yellow }
if ($ShowUTC) { Write-Host "                     [WITH UTC CONVERSIONS]" -ForegroundColor Yellow }
Write-Host ("🛬" * 40) -ForegroundColor Green
Write-Host ""

# Display flights
foreach ($f in $flights) {
	$f.Print($ShowUTC, $ShowDelays)
}

# Display map if requested
if ($ShowMap) {
	Show-RouteMap
}

# Usage info
if (-not $ShowDelays -and -not $ShowUTC -and -not $ShowMap) {
	Write-Host ""
	Write-Host "💡 TIP: Run with additional options:" -ForegroundColor Cyan
	Write-Host "  .\flight-tracker-all.ps1 -ShowDelays" -ForegroundColor White
	Write-Host "  .\flight-tracker-all.ps1 -ShowUTC" -ForegroundColor White
	Write-Host "  .\flight-tracker-all.ps1 -ShowMap" -ForegroundColor White
	Write-Host "  .\flight-tracker-all.ps1 -ShowAll" -ForegroundColor Yellow
	Write-Host ""
}

Write-Host ("="*80) -ForegroundColor Green
Write-Host ""
