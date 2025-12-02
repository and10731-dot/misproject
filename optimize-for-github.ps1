# optimize-for-github.ps1 - Optimize project files for GitHub

Write-Host "Starting optimization for GitHub..." -ForegroundColor Green

# Check if ImageMagick is available for image optimization
$hasImageMagick = Get-Command magick -ErrorAction SilentlyContinue

# Function to compress images
function Optimize-Image {
    param($FilePath, $Quality = 85)
    
    if ($hasImageMagick) {
        $output = $FilePath -replace '\.(jpg|jpeg)$', '_opt.jpg'
        magick $FilePath -quality $Quality -strip $output
        if (Test-Path $output) {
            $originalSize = (Get-Item $FilePath).Length
            $newSize = (Get-Item $output).Length
            if ($newSize -lt $originalSize) {
                Move-Item $output $FilePath -Force
                Write-Host "Optimized: $FilePath ($([math]::Round($originalSize/1MB, 2))MB -> $([math]::Round($newSize/1MB, 2))MB)" -ForegroundColor Yellow
            }
        }
    }
}

# Optimize background images
Write-Host "`nOptimizing background images..." -ForegroundColor Cyan
if (Test-Path "files\fall-woods-bg.jpg") {
    Optimize-Image "files\fall-woods-bg.jpg" 80
}
if (Test-Path "files\fall-woods-bg-deer.jpg") {
    Optimize-Image "files\fall-woods-bg-deer.jpg" 80
}
if (Test-Path "assets\backgrounds\fall-woods-bg.jpg") {
    Optimize-Image "assets\backgrounds\fall-woods-bg.jpg" 80
}

# Optimize hobby images
Write-Host "`nOptimizing hobby images..." -ForegroundColor Cyan
Get-ChildItem -Path "images" -Recurse -Include "*.jpg", "*.jpeg" | ForEach-Object {
    Optimize-Image $_.FullName 85
}

# Optimize headshot
if (Test-Path "images\headshot.jpg") {
    Optimize-Image "images\headshot.jpg" 90
}

# Note about video conversion
Write-Host "`nVideo files need manual conversion:" -ForegroundColor Yellow
Write-Host "  - Convert videos/*.MOV to MP4 format using:" -ForegroundColor Yellow
Write-Host "    ffmpeg -i input.MOV -c:v libx264 -crf 23 -c:a aac -b:a 128k output.mp4" -ForegroundColor Gray
Write-Host "  - This will reduce video size by 70-80%" -ForegroundColor Yellow

# Note about audio compression
Write-Host "`nAudio file optimization:" -ForegroundColor Yellow
Write-Host "  - game-background-music.mp3 can be compressed using:" -ForegroundColor Yellow
Write-Host "    ffmpeg -i input.mp3 -b:a 128k output.mp3" -ForegroundColor Gray

Write-Host "`nOptimization complete!" -ForegroundColor Green
Write-Host "Remember to:" -ForegroundColor Cyan
Write-Host "  1. Convert .MOV files to .mp4" -ForegroundColor White
Write-Host "  2. Update HTML files to reference .mp4 instead of .MOV" -ForegroundColor White
Write-Host "  3. Compress audio files if needed" -ForegroundColor White

