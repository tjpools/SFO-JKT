@{
	# Script module or binary module file associated with this manifest
	RootModule = 'FlightTools.psm1'

	# Version number of this module
	ModuleVersion = '1.0.0'

	# ID used to uniquely identify this module
	GUID = 'f1a7c8e2-9b3d-4e5f-a6c7-8d9e0f1a2b3c'

	# Author of this module
	Author = 'Terrence J McLaughlin'

	# Company or vendor of this module
	CompanyName = '@tjpools'

	# Copyright statement for this module
	Copyright = '(c) 2025 Terrence J McLaughlin. All rights reserved. MIT License.'

	# Description of the functionality provided by this module
	Description = 'Flight tracking tools for managing and displaying flight itineraries with timezone conversions, delay tracking, and route visualization. Built for the SFO-Jakarta route via Tokyo.'

	# Minimum version of the PowerShell engine required by this module
	PowerShellVersion = '5.1'

	# Functions to export from this module
	FunctionsToExport = @(
		'Get-FlightItinerary',
		'Show-FlightTracker',
		'Show-FlightMap',
		'Show-FlightDelays',
		'Show-FlightUTC',
		'ConvertTo-FlightUTC',
		'New-FlightLeg',
		'Test-FlightTools'
	)

	# Cmdlets to export from this module
	CmdletsToExport = @()

	# Variables to export from this module
	VariablesToExport = @()

	# Aliases to export from this module
	AliasesToExport = @(
		'flights',
		'flight-map',
		'flight-delays',
		'flight-utc'
	)

	# List of all files packaged with this module
	FileList = @(
		'FlightTools.psm1',
		'FlightTools.psd1',
		'flight-tracker.ps1',
		'flight-tracker-all.ps1',
		'flight-tracker-with-delays.ps1',
		'flight-tracker-utc.ps1',
		'flight-map.ps1',
		'FlightLeg.ps1',
		'utc-converter.ps1',
		'test-all.ps1'
	)

	# Private data to pass to the module specified in RootModule/ModuleToProcess
	PrivateData = @{
		PSData = @{
			# Tags applied to this module for searching in online galleries
			Tags = @(
				'Flight',
				'Tracker',
				'Timezone',
				'Travel',
				'Aviation',
				'SFO',
				'Jakarta',
				'Tokyo',
				'ANA',
				'Itinerary'
			)

			# A URL to the license for this module
			LicenseUri = 'https://github.com/tjpools/SFO-JKT/blob/main/LICENSE'

			# A URL to the main website for this project
			ProjectUri = 'https://github.com/tjpools/SFO-JKT'

			# A URL to an icon representing this module
			# IconUri = ''

			# ReleaseNotes of this module
			ReleaseNotes = @'
# Release Notes - v1.0.0

## Features
- Complete flight tracking for SFO-Jakarta route
- Timezone conversions (PDT, JST, WIB, UTC)
- Delay tracking with color-coded output
- ASCII route map visualization
- Modular class system (FlightLeg)
- Zero external dependencies

## Commands
- Get-FlightItinerary: Retrieve flight data
- Show-FlightTracker: Display all flights
- Show-FlightMap: Show route visualization
- Show-FlightDelays: Display delay information
- Show-FlightUTC: Show UTC conversions

## Quick Start
```powershell
Import-Module FlightTools
Show-FlightTracker -ShowAll
```

## Documentation
https://github.com/tjpools/SFO-JKT#readme
'@
		}
	}
}
