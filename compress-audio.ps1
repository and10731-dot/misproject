# compress-audio.ps1 - Compress audio files

Write-Host "Audio Compression Script" -ForegroundColor Green

$ffmpeg = Get-Command ffmpeg -ErrorAction SilentlyContinue

if (-not $ffmpeg) {
    Write-Host "FFmpeg not found. Please install FFmpeg." -ForegroundColor Red
    Write-Host "Alternative: Use online converter like https://www.freeconvert.com/mp3-compressor" -ForegroundColor Yellow
    exit
}

$audioFile = "files\game-background-music.mp3"
if (Test-Path $audioFile) {
    Write-Host "Compressing $audioFile..." -ForegroundColor Cyan
    $sizeBefore = (Get-Item $audioFile).Length / 1MB
    $output = "files\game-background-music-compressed.mp3"
    
    # Compress to 128kbps (good quality, smaller size)
    & ffmpeg -i $audioFile -b:a 128k -ar 44100 $output -y
    
    if (Test-Path $output) {
        $sizeAfter = (Get-Item $output).Length / 1MB
        $savings = [math]::Round((1 - ($sizeAfter / $sizeBefore)) * 100, 1)
        Write-Host "  Success! $([math]::Round($sizeBefore, 2))MB -> $([math]::Round($sizeAfter, 2))MB ($savings% reduction)" -ForegroundColor Green
        
        # Replace original if new file is smaller
        if ($sizeAfter -lt $sizeBefore) {
            Move-Item $output $audioFile -Force
            Write-Host "  Replaced original with compressed version" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "Audio file not found: $audioFile" -ForegroundColor Red
}

