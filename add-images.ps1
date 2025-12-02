# Script to help add images to the website
# This will guide you through adding your images

Write-Host "========================================"
Write-Host "Image Setup for Portfolio Website"
Write-Host "========================================"
Write-Host ""

$soccerPath = "images\soccer"
$huntingPath = "images\hunting-fishing"

# Check if folders exist
if (-not (Test-Path $soccerPath)) {
    New-Item -ItemType Directory -Path $soccerPath -Force | Out-Null
}
if (-not (Test-Path $huntingPath)) {
    New-Item -ItemType Directory -Path $huntingPath -Force | Out-Null
}

Write-Host "Image folders are ready!"
Write-Host ""
Write-Host "Please add your images with these exact names:"
Write-Host ""
Write-Host "SOCCER IMAGES (in images\soccer\):"
Write-Host "  - soccer-1.jpg (ACL injury recovery - knee with ice pack)"
Write-Host "  - soccer-2.jpg (Two boys playing soccer)"
Write-Host "  - soccer-3.jpg (Team handshake/camaraderie)"
Write-Host ""
Write-Host "HUNTING/FISHING IMAGES (in images\hunting-fishing\):"
Write-Host "  - hunting-1.jpg (Fawn being held)"
Write-Host "  - hunting-2.jpg (Northern Pike and fish catch)"
Write-Host "  - hunting-3.jpg (Three hunters with deer)"
Write-Host ""
Write-Host "========================================"
Write-Host "Checking for existing images..."
Write-Host "========================================"

$soccerFiles = @("soccer-1.jpg", "soccer-2.jpg", "soccer-3.jpg")
$huntingFiles = @("hunting-1.jpg", "hunting-2.jpg", "hunting-3.jpg")

Write-Host ""
Write-Host "Soccer Images:"
foreach ($file in $soccerFiles) {
    $fullPath = Join-Path $soccerPath $file
    if (Test-Path $fullPath) {
        Write-Host "  ✓ $file - FOUND" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file - MISSING" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Hunting/Fishing Images:"
foreach ($file in $huntingFiles) {
    $fullPath = Join-Path $huntingPath $file
    if (Test-Path $fullPath) {
        Write-Host "  ✓ $file - FOUND" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file - MISSING" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================"
Write-Host "To add images:"
Write-Host "1. Copy your image files"
Write-Host "2. Paste them into the folders listed above"
Write-Host "3. Make sure the filenames match exactly"
Write-Host "4. Refresh your browser to see them!"
Write-Host "========================================"


