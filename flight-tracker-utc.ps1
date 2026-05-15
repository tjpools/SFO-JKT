# ========================================
# Flight Tracker - With UTC Conversions
# ========================================

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

	Flight([string]$n,[string]$r,[datetime]$d,[string]$dtz,[int]$dOff,
		   [datetime]$a,[string]$atz,[int]$aOff,[timespan]$dur,[string]$s) {
		$this.Number       = $n
		$this.Route        = $r
		$this.Departure    = $d
		$this.DepTz        = $dtz
		$this.DepUtcOffset = $dOff
		$this.Arrival      = $a
		$this.ArrTz        = $atz
		$this.ArrUtcOffset = $aOff
		$this.Duration     = $dur
		$this.Seats        = $s
	}

	[string]GetDepUtc() {
		$utc = $this.Departure.AddHours(-$this.DepUtcOffset)
		return $utc.ToString("yyyy-MM-dd HH:mm") + " UTC"
	}

	[string]GetArrUtc() {
		$utc = $this.Arrival.AddHours(-$this.ArrUtcOffset)
		return $utc.ToString("yyyy-MM-dd HH:mm") + " UTC"
	}

	[void]PrintWithUtc() {
		Write-Host "FLIGHT $($this.Number) — $($this.Route)" -ForegroundColor Cyan
		Write-Host ("-" * 80) -ForegroundColor DarkGray

		Write-Host ("Local Departure  : {0} {1}" -f $this.Departure, $this.DepTz) -ForegroundColor Green
		Write-Host ("Departure (UTC)  : {0}" -f $this.GetDepUtc()) -ForegroundColor DarkGreen

		Write-Host ("Local Arrival    : {0} {1}" -f $this.Arrival, $this.ArrTz) -ForegroundColor Yellow
		Write-Host ("Arrival (UTC)    : {0}" -f $this.GetArrUtc()) -ForegroundColor DarkYellow

		Write-Host ("Duration         : {0:hh}h {0:mm}m" -f $this.Duration) -ForegroundColor White
		Write-Host ("Seats            : {0}" -f $this.Seats) -ForegroundColor White
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
Write-Host ""
Write-Host ("="*80) -ForegroundColor Green
Write-Host "                  FLIGHT TRACKER - WITH UTC CONVERSIONS" -ForegroundColor Yellow
Write-Host ("="*80) -ForegroundColor Green
Write-Host ""

# Build flights with UTC offsets
$flights = @(
	[Flight]::new("ANA 107","SFO → HND",
		(DT 2026 7 2 1 40),"PDT",-7,  # PDT = UTC-7
		(DT 2026 7 3 4 25),"JST",9,   # JST = UTC+9
		([timespan]::FromMinutes(10*60+45)),
		"34A, 34C"),

	[Flight]::new("ANA 855","HND → CGK",
		(DT 2026 7 3 10 15),"JST",9,  # JST = UTC+9
		(DT 2026 7 3 16 0),"WIB",7,   # WIB = UTC+7
		([timespan]::FromMinutes(7*60+45)),
		"21A, 21B"),

	[Flight]::new("ANA 856","CGK → HND",
		(DT 2026 7 19 21 25),"WIB",7,  # WIB = UTC+7
		(DT 2026 7 20 6 50),"JST",9,   # JST = UTC+9
		([timespan]::FromMinutes(7*60+25)),
		"21A, 21B"),

	[Flight]::new("ANA 108","HND → SFO",
		(DT 2026 7 20 22 55),"JST",9,  # JST = UTC+9
		(DT 2026 7 20 16 55),"PDT",-7, # PDT = UTC-7
		([timespan]::FromMinutes(11*60)),
		"32A, 32C")
)

foreach ($f in $flights) {
	$f.PrintWithUtc()
}

Write-Host ("="*80) -ForegroundColor Green
Write-Host ""
