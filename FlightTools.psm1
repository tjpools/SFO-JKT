# FlightTools PowerShell Module
# Complete flight tracking toolkit for SFO-Jakarta route

#region Module Setup

# Module variables
$script:ModuleRoot = $PSScriptRoot
$script:FlightData = @()

#endregion

#region Helper Functions

function DT($year, $month, $day, $hour, $min) {
	<#
	.SYNOPSIS
	Quick DateTime builder
	#>
	[datetime]::SpecifyKind(
		(Get-Date -Year $year -Month $month -Day $day -Hour $hour -Minute $min -Second 0),
		'Unspecified'
	)
}

#endregion

#region Public Functions

function Get-FlightItinerary {
	<#
	.SYNOPSIS
	Get the SFO-Jakarta flight itinerary

	.DESCRIPTION
	Returns flight data for the complete round-trip itinerary

	.EXAMPLE
	Get-FlightItinerary

	.OUTPUTS
	Array of flight objects
	#>
	[CmdletBinding()]
	param()

	# Load FlightLeg class if available
	$flightLegPath = Join-Path $script:ModuleRoot "FlightLeg.ps1"
	if (Test-Path $flightLegPath) {
		. $flightLegPath
	}

	# Return flight data structure
	return @{
		Outbound = @(
			@{Number="ANA 107"; Route="SFO → HND"; Departure="Jul 2, 01:40 AM PDT"; Arrival="Jul 3, 04:25 AM JST"; Duration="10h 45m"; Seats="34A, 34C"}
			@{Number="ANA 855"; Route="HND → CGK"; Departure="Jul 3, 10:15 AM JST"; Arrival="Jul 3, 04:00 PM WIB"; Duration="7h 45m"; Seats="21A, 21B"}
		)
		Return = @(
			@{Number="ANA 856"; Route="CGK → HND"; Departure="Jul 19, 09:25 PM WIB"; Arrival="Jul 20, 06:50 AM JST"; Duration="7h 25m"; Seats="21A, 21B"}
			@{Number="ANA 108"; Route="HND → SFO"; Departure="Jul 20, 10:55 PM JST"; Arrival="Jul 20, 04:55 PM PDT"; Duration="11h 00m"; Seats="32A, 32C"}
		)
	}
}

function Show-FlightTracker {
	<#
	.SYNOPSIS
	Display complete flight tracker

	.DESCRIPTION
	Shows all flights with optional features

	.PARAMETER ShowAll
	Display all features (delays, UTC, map)

	.PARAMETER ShowDelays
	Display delay tracking

	.PARAMETER ShowUTC
	Display UTC conversions

	.PARAMETER ShowMap
	Display route map

	.EXAMPLE
	Show-FlightTracker -ShowAll

	.EXAMPLE
	Show-FlightTracker -ShowDelays
	#>
	[CmdletBinding()]
	[Alias('flights')]
	param(
		[switch]$ShowAll,
		[switch]$ShowDelays,
		[switch]$ShowUTC,
		[switch]$ShowMap
	)

	$trackerPath = Join-Path $script:ModuleRoot "flight-tracker-all.ps1"
	if (Test-Path $trackerPath) {
		$params = @{}
		if ($ShowAll) { $params['ShowAll'] = $true }
		if ($ShowDelays) { $params['ShowDelays'] = $true }
		if ($ShowUTC) { $params['ShowUTC'] = $true }
		if ($ShowMap) { $params['ShowMap'] = $true }

		& $trackerPath @params
	} else {
		Write-Error "Flight tracker script not found: $trackerPath"
	}
}

function Show-FlightMap {
	<#
	.SYNOPSIS
	Display ASCII route map

	.DESCRIPTION
	Shows visual representation of flight routes

	.EXAMPLE
	Show-FlightMap
	#>
	[CmdletBinding()]
	[Alias('flight-map')]
	param()

	$mapPath = Join-Path $script:ModuleRoot "flight-map.ps1"
	if (Test-Path $mapPath) {
		& $mapPath
	} else {
		Write-Error "Flight map script not found: $mapPath"
	}
}

function Show-FlightDelays {
	<#
	.SYNOPSIS
	Display flight delay information

	.DESCRIPTION
	Shows scheduled vs actual arrival times with delay calculations

	.EXAMPLE
	Show-FlightDelays
	#>
	[CmdletBinding()]
	[Alias('flight-delays')]
	param()

	$delayPath = Join-Path $script:ModuleRoot "flight-tracker-with-delays.ps1"
	if (Test-Path $delayPath) {
		& $delayPath
	} else {
		Write-Error "Delay tracker script not found: $delayPath"
	}
}

function Show-FlightUTC {
	<#
	.SYNOPSIS
	Display flights with UTC conversions

	.DESCRIPTION
	Shows all times in both local and UTC timezones

	.EXAMPLE
	Show-FlightUTC
	#>
	[CmdletBinding()]
	[Alias('flight-utc')]
	param()

	$utcPath = Join-Path $script:ModuleRoot "flight-tracker-utc.ps1"
	if (Test-Path $utcPath) {
		& $utcPath
	} else {
		Write-Error "UTC tracker script not found: $utcPath"
	}
}

function ConvertTo-FlightUTC {
	<#
	.SYNOPSIS
	Convert a local time to UTC

	.DESCRIPTION
	Converts a datetime with timezone offset to UTC

	.PARAMETER DateTime
	The datetime to convert

	.PARAMETER OffsetHours
	UTC offset in hours (e.g., -7 for PDT, +9 for JST)

	.EXAMPLE
	ConvertTo-FlightUTC -DateTime (Get-Date) -OffsetHours -7
	#>
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[datetime]$DateTime,

		[Parameter(Mandatory)]
		[int]$OffsetHours
	)

	$utc = $DateTime.AddHours(-$OffsetHours)
	return $utc.ToString("yyyy-MM-dd HH:mm") + " UTC"
}

function New-FlightLeg {
	<#
	.SYNOPSIS
	Create a new flight leg object

	.DESCRIPTION
	Creates a FlightLeg object for custom itineraries

	.PARAMETER Number
	Flight number

	.PARAMETER From
	Origin airport code

	.PARAMETER To
	Destination airport code

	.PARAMETER Departure
	Departure datetime

	.PARAMETER DepartureTZ
	Departure timezone

	.PARAMETER Arrival
	Arrival datetime

	.PARAMETER ArrivalTZ
	Arrival timezone

	.PARAMETER Duration
	Flight duration

	.PARAMETER Seats
	Seat assignments

	.EXAMPLE
	New-FlightLeg -Number "UA 123" -From "SFO" -To "NRT" -Departure (Get-Date) -DepartureTZ "PDT" -Arrival (Get-Date).AddHours(11) -ArrivalTZ "JST" -Duration ([timespan]::FromHours(11)) -Seats "12A"
	#>
	[CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[string]$Number,

		[Parameter(Mandatory)]
		[string]$From,

		[Parameter(Mandatory)]
		[string]$To,

		[Parameter(Mandatory)]
		[datetime]$Departure,

		[Parameter(Mandatory)]
		[string]$DepartureTZ,

		[Parameter(Mandatory)]
		[datetime]$Arrival,

		[Parameter(Mandatory)]
		[string]$ArrivalTZ,

		[Parameter(Mandatory)]
		[timespan]$Duration,

		[Parameter(Mandatory)]
		[string]$Seats
	)

	# Load FlightLeg class
	$flightLegPath = Join-Path $script:ModuleRoot "FlightLeg.ps1"
	if (Test-Path $flightLegPath) {
		. $flightLegPath
		return [FlightLeg]::new($Number, $From, $To, $Departure, $DepartureTZ, $Arrival, $ArrivalTZ, $Duration, $Seats)
	} else {
		Write-Error "FlightLeg class not found"
	}
}

function Test-FlightTools {
	<#
	.SYNOPSIS
	Run module test suite

	.DESCRIPTION
	Tests all module functions and scripts

	.EXAMPLE
	Test-FlightTools
	#>
	[CmdletBinding()]
	param()

	$testPath = Join-Path $script:ModuleRoot "test-all.ps1"
	if (Test-Path $testPath) {
		& $testPath
	} else {
		Write-Error "Test script not found: $testPath"
	}
}

#endregion

#region Module Export

Export-ModuleMember -Function @(
	'Get-FlightItinerary',
	'Show-FlightTracker',
	'Show-FlightMap',
	'Show-FlightDelays',
	'Show-FlightUTC',
	'ConvertTo-FlightUTC',
	'New-FlightLeg',
	'Test-FlightTools'
) -Alias @(
	'flights',
	'flight-map',
	'flight-delays',
	'flight-utc'
)

#endregion

# Module loaded successfully
Write-Verbose "FlightTools module loaded successfully"
