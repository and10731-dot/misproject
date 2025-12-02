# Create placeholder images for the website

Add-Type -AssemblyName System.Drawing

$soccerFolder = "images\soccer"
$huntingFolder = "images\hunting-fishing"

# Create folders if they don't exist
if (-not (Test-Path $soccerFolder)) { New-Item -ItemType Directory -Path $soccerFolder -Force | Out-Null }
if (-not (Test-Path $huntingFolder)) { New-Item -ItemType Directory -Path $huntingFolder -Force | Out-Null }

function Create-PlaceholderImage {
    param(
        [string]$FilePath,
        [string]$Text,
        [System.Drawing.Color]$Color
    )
    
    $width = 800
    $height = 600
    $bitmap = New-Object System.Drawing.Bitmap($width, $height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    
    # High quality
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
    
    # Fill background
    $brush = New-Object System.Drawing.SolidBrush($Color)
    $graphics.FillRectangle($brush, 0, 0, $width, $height)
    
    # Add border
    $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::White, 8)
    $graphics.DrawRectangle($pen, 4, 4, $width - 8, $height - 8)
    
    # Add text
    $font = New-Object System.Drawing.Font("Arial", 32, [System.Drawing.FontStyle]::Bold)
    $textBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    
    $graphics.DrawString($Text, $font, $textBrush, $width/2, $height/2, $format)
    
    # Save
    $bitmap.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    # Cleanup
    $graphics.Dispose()
    $bitmap.Dispose()
    $brush.Dispose()
    $pen.Dispose()
    $textBrush.Dispose()
    $font.Dispose()
}

Write-Host "Creating placeholder images..."

# Soccer images
Create-PlaceholderImage "$soccerFolder\soccer-1.jpg" "ACL Recovery`nKnee with Ice Pack" ([System.Drawing.Color]::FromArgb(70, 130, 180))
Create-PlaceholderImage "$soccerFolder\soccer-2.jpg" "Soccer Game`nTwo Boys Playing" ([System.Drawing.Color]::FromArgb(50, 205, 50))
Create-PlaceholderImage "$soccerFolder\soccer-3.jpg" "Team Camaraderie`nHandshake Photo" ([System.Drawing.Color]::FromArgb(30, 144, 255))

# Hunting/Fishing images
Create-PlaceholderImage "$huntingFolder\hunting-1.jpg" "Hunting`nFawn Being Held" ([System.Drawing.Color]::FromArgb(139, 90, 43))
Create-PlaceholderImage "$huntingFolder\hunting-2.jpg" "Fishing`nNorthern Pike Catch" ([System.Drawing.Color]::FromArgb(34, 139, 34))
Create-PlaceholderImage "$huntingFolder\hunting-3.jpg" "Hunting`nThree Hunters with Deer" ([System.Drawing.Color]::FromArgb(101, 67, 33))

Write-Host "Placeholder images created successfully!"
Write-Host "You can now see images on your website."
Write-Host "Replace these with your actual photos when ready."


