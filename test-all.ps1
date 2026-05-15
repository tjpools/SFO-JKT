# ========================================
# TEST ALL COMPONENTS
# Verifies all scripts work correctly
# ========================================

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║           🧪 SFO-JKT FLIGHT TRACKER - TEST SUITE           ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$results = @()

# Test 1: Python script exists
Write-Host "🔍 Test 1: Checking Python script..." -NoNewline
if (Test-Path "flight_tracker.py") {
	Write-Host " ✅ PASS" -ForegroundColor Green
	$results += @{Test="Python script exists"; Status="✅ PASS"}
} else {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="Python script exists"; Status="❌ FAIL"}
}

# Test 2: Requirements.txt exists
Write-Host "🔍 Test 2: Checking requirements.txt..." -NoNewline
if (Test-Path "requirements.txt") {
	Write-Host " ✅ PASS" -ForegroundColor Green
	$results += @{Test="requirements.txt exists"; Status="✅ PASS"}
} else {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="requirements.txt exists"; Status="❌ FAIL"}
}

# Test 3: PowerShell scripts exist
Write-Host "🔍 Test 3: Checking PowerShell scripts..." -NoNewline
$psScripts = @(
	"flight-tracker.ps1",
	"flight-tracker-all.ps1",
	"flight-tracker-with-delays.ps1",
	"flight-tracker-utc.ps1",
	"flight-map.ps1",
	"FlightLeg.ps1"
)
$allExist = $true
foreach ($script in $psScripts) {
	if (-not (Test-Path $script)) {
		$allExist = $false
		break
	}
}
if ($allExist) {
	Write-Host " ✅ PASS ($($psScripts.Count) scripts)" -ForegroundColor Green
	$results += @{Test="PowerShell scripts exist"; Status="✅ PASS"}
} else {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="PowerShell scripts exist"; Status="❌ FAIL"}
}

# Test 4: Documentation exists
Write-Host "🔍 Test 4: Checking documentation..." -NoNewline
$docs = @(
	"README.md",
	"QUICKSTART.md",
	"START_HERE.md",
	"SETUP.md",
	"GITHUB_SETUP.md"
)
$allDocsExist = $true
foreach ($doc in $docs) {
	if (-not (Test-Path $doc)) {
		$allDocsExist = $false
		break
	}
}
if ($allDocsExist) {
	Write-Host " ✅ PASS ($($docs.Count) files)" -ForegroundColor Green
	$results += @{Test="Documentation exists"; Status="✅ PASS"}
} else {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="Documentation exists"; Status="❌ FAIL"}
}

# Test 5: Configuration files
Write-Host "🔍 Test 5: Checking config files..." -NoNewline
$configs = @(".gitignore", "LICENSE", "windows-terminal-theme.json")
$allConfigsExist = $true
foreach ($config in $configs) {
	if (-not (Test-Path $config)) {
		$allConfigsExist = $false
		break
	}
}
if ($allConfigsExist) {
	Write-Host " ✅ PASS" -ForegroundColor Green
	$results += @{Test="Config files exist"; Status="✅ PASS"}
} else {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="Config files exist"; Status="❌ FAIL"}
}

# Test 6: Python is installed
Write-Host "🔍 Test 6: Checking Python installation..." -NoNewline
try {
	$pyVersion = python --version 2>&1
	Write-Host " ✅ PASS ($pyVersion)" -ForegroundColor Green
	$results += @{Test="Python installed"; Status="✅ PASS"}
} catch {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="Python installed"; Status="❌ FAIL"}
}

# Test 7: Git is installed
Write-Host "🔍 Test 7: Checking Git installation..." -NoNewline
try {
	$gitVersion = git --version 2>&1
	Write-Host " ✅ PASS ($gitVersion)" -ForegroundColor Green
	$results += @{Test="Git installed"; Status="✅ PASS"}
} catch {
	Write-Host " ❌ FAIL" -ForegroundColor Red
	$results += @{Test="Git installed"; Status="❌ FAIL"}
}

# Test 8: Virtual environment
Write-Host "🔍 Test 8: Checking Python virtual environment..." -NoNewline
if (Test-Path ".venv") {
	Write-Host " ✅ PASS (.venv exists)" -ForegroundColor Green
	$results += @{Test="Virtual environment"; Status="✅ PASS"}
} else {
	Write-Host " ⚠️  WARN (not created yet)" -ForegroundColor Yellow
	$results += @{Test="Virtual environment"; Status="⚠️  WARN"}
}

# Test 9: Try running basic PowerShell script
Write-Host "🔍 Test 9: Testing basic PowerShell script..." -NoNewline
try {
	$output = & .\flight-tracker.ps1 2>&1 | Out-String
	Write-Host " ✅ PASS" -ForegroundColor Green
	$results += @{Test="PowerShell execution"; Status="✅ PASS"}
} catch {
	Write-Host " ❌ FAIL ($($_.Exception.Message))" -ForegroundColor Red
	$results += @{Test="PowerShell execution"; Status="❌ FAIL"}
}

# Test 10: Python dependencies (if venv exists)
Write-Host "🔍 Test 10: Checking Python dependencies..." -NoNewline
if (Test-Path ".venv\Scripts\Activate.ps1") {
	try {
		& .\.venv\Scripts\Activate.ps1
		$pytzInstalled = pip list 2>&1 | Select-String "pytz"
		$tabulateInstalled = pip list 2>&1 | Select-String "tabulate"

		if ($pytzInstalled -and $tabulateInstalled) {
			Write-Host " ✅ PASS" -ForegroundColor Green
			$results += @{Test="Python dependencies"; Status="✅ PASS"}
		} else {
			Write-Host " ❌ FAIL (dependencies missing)" -ForegroundColor Red
			$results += @{Test="Python dependencies"; Status="❌ FAIL"}
		}
	} catch {
		Write-Host " ❌ FAIL" -ForegroundColor Red
		$results += @{Test="Python dependencies"; Status="❌ FAIL"}
	}
} else {
	Write-Host " ⚠️  SKIP (no venv)" -ForegroundColor Yellow
	$results += @{Test="Python dependencies"; Status="⚠️  SKIP"}
}

# Summary
Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                      📊 TEST SUMMARY                        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$passed = ($results | Where-Object { $_.Status -eq "✅ PASS" }).Count
$failed = ($results | Where-Object { $_.Status -eq "❌ FAIL" }).Count
$warned = ($results | Where-Object { $_.Status -match "⚠️" }).Count
$total = $results.Count

Write-Host "Total Tests: " -NoNewline
Write-Host $total -ForegroundColor White
Write-Host "Passed:      " -NoNewline
Write-Host $passed -ForegroundColor Green
Write-Host "Failed:      " -NoNewline
Write-Host $failed -ForegroundColor Red
Write-Host "Warnings:    " -NoNewline
Write-Host $warned -ForegroundColor Yellow

Write-Host ""

if ($failed -eq 0) {
	Write-Host "🎉 ALL TESTS PASSED! Your project is ready!" -ForegroundColor Green
	Write-Host ""
	Write-Host "✅ Next steps:" -ForegroundColor Cyan
	Write-Host "   1. Review START_HERE.md" -ForegroundColor White
	Write-Host "   2. Run: .\flight-tracker-all.ps1 -ShowAll" -ForegroundColor White
	Write-Host "   3. Push to GitHub: git push -u origin main" -ForegroundColor White
} else {
	Write-Host "⚠️  Some tests failed. Review the errors above." -ForegroundColor Yellow
	Write-Host ""
	Write-Host "Common fixes:" -ForegroundColor Cyan
	Write-Host "   • Missing files: Check you're in the correct directory" -ForegroundColor White
	Write-Host "   • Python not found: Install Python from python.org" -ForegroundColor White
	Write-Host "   • Git not found: Install Git from git-scm.com" -ForegroundColor White
	Write-Host "   • Venv not found: Run 'python -m venv .venv'" -ForegroundColor White
}

Write-Host ""
Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
