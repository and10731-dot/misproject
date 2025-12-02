# Optimization Guide for GitHub

This guide explains how to optimize the project files for GitHub hosting.

## Current File Sizes

### Large Files to Optimize:
- **Videos**: `.MOV` files (~72MB each) → Convert to `.mp4` (~15-20MB each)
- **Audio**: `game-background-music.mp3` (8.5MB) → Compress to 128kbps (~2-3MB)
- **Images**: Some JPGs are 5MB → Optimize to <1MB

## Optimization Steps

### 1. Convert Videos to MP4

**Option A: Using FFmpeg (Recommended)**
```powershell
# Install FFmpeg first, then run:
.\convert-videos.ps1
```

**Option B: Online Converter**
1. Go to https://cloudconvert.com/mov-to-mp4
2. Upload `videos/IMG_5708.MOV` and `videos/umd-marketing-video.MOV`
3. Use these settings:
   - Video codec: H.264
   - Quality: Medium (CRF 23)
   - Audio: AAC, 128kbps
4. Download and replace the .MOV files with .mp4 versions
5. Rename to match: `IMG_5708.mp4` and `umd-marketing-video.mp4`

### 2. Compress Audio

**Option A: Using FFmpeg**
```powershell
.\compress-audio.ps1
```

**Option B: Online Compressor**
1. Go to https://www.freeconvert.com/mp3-compressor
2. Upload `files/game-background-music.mp3`
3. Set quality to 128kbps
4. Download and replace the original file

### 3. Optimize Images (Optional)

Images are already reasonably sized, but you can further optimize:
- Use https://tinypng.com/ or https://squoosh.app/
- Target: <500KB per image

## After Optimization

1. **Update HTML files** (Already done):
   - Videos now reference `.mp4` first, with `.MOV` as fallback
   - Background image uses optimized version

2. **Test the website**:
   - All videos should play correctly
   - Audio should work
   - Images should load quickly

3. **Commit to GitHub**:
   ```bash
   git add .
   git commit -m "Optimize files for GitHub hosting"
   git push
   ```

## Expected Size Reductions

- Videos: 72MB → ~15-20MB each (70-80% reduction)
- Audio: 8.5MB → ~2-3MB (65-70% reduction)
- **Total savings: ~130MB+**

## Notes

- The `.gitignore` file excludes large unoptimized files
- Keep `.MOV` files as backups locally (they're in .gitignore)
- The website will work with both formats (MP4 preferred, MOV as fallback)

