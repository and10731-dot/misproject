# convert-videos.ps1 - Convert MOV files to optimized MP4

Write-Host "Video Conversion Script" -ForegroundColor Green
Write-Host "This script will help you convert .MOV files to compressed .mp4 format" -ForegroundColor Yellow
Write-Host ""

# Check for ffmpeg
$ffmpeg = Get-Command ffmpeg -ErrorAction SilentlyContinue

if (-not $ffmpeg) {
    Write-Host "FFmpeg not found. Please install FFmpeg to convert videos." -ForegroundColor Red
    Write-Host "Download from: https://ffmpeg.org/download.html" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Alternative: Use online converter like:" -ForegroundColor Yellow
    Write-Host "  - https://cloudconvert.com/mov-to-mp4" -ForegroundColor Gray
    Write-Host "  - https://convertio.co/mov-mp4/" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Recommended settings for MP4 conversion:" -ForegroundColor Cyan
    Write-Host "  - Video codec: H.264" -ForegroundColor White
    Write-Host "  - Quality: Medium (CRF 23)" -ForegroundColor White
    Write-Host "  - Audio: AAC, 128kbps" -ForegroundColor White
    Write-Host "  - This should reduce size by 70-80%" -ForegroundColor White
    exit
}

# Convert videos
$videos = @(
    @{Source="videos\IMG_5708.MOV"; Dest="videos\IMG_5708.mp4"},
    @{Source="videos\umd-marketing-video.MOV"; Dest="videos\umd-marketing-video.mp4"}
)

foreach ($video in $videos) {
    if (Test-Path $video.Source) {
        Write-Host "Converting $($video.Source)..." -ForegroundColor Cyan
        $sizeBefore = (Get-Item $video.Source).Length / 1MB
        
        # Convert with compression
        & ffmpeg -i $video.Source -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k -movflags +faststart $video.Dest -y
        
        if (Test-Path $video.Dest) {
            $sizeAfter = (Get-Item $video.Dest).Length / 1MB
            $savings = [math]::Round((1 - ($sizeAfter / $sizeBefore)) * 100, 1)
            Write-Host "  Success! $([math]::Round($sizeBefore, 2))MB -> $([math]::Round($sizeAfter, 2))MB ($savings% reduction)" -ForegroundColor Green
        }
    }
}

Write-Host "`nConversion complete!" -ForegroundColor Green

