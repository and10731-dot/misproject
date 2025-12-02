# Project Structure for GitHub

## File Organization

```
misproject1/
├── index.html              # Home page (GitHub Pages entry point)
├── hobbies.html            # Hobbies page
├── discover.html           # UMD & Duluth information
├── resume.html             # Professional resume
├── career.html             # Career interests
├── game.html               # Memory match game
│
├── CSS/
│   ├── style.css          # Main site styles
│   └── game.css           # Game-specific styles
│
├── js/
│   ├── main.js            # Site navigation
│   ├── background-music.js      # Site-wide music
│   ├── game-background-music.js  # Game page music
│   └── memory-game-clash.js      # Game logic
│
├── images/
│   ├── headshot.jpg       # Professional headshot
│   ├── soccer/            # Soccer hobby images (3 images)
│   └── hunting-fishing/   # Hunting & fishing images (3 images)
│
├── videos/
│   ├── IMG_5708.MOV       # Introduction video (home page)
│   └── umd-marketing-video.MOV  # UMD marketing video
│
├── files/
│   ├── video.MOV          # Marketing video (discover page)
│   ├── game-background-music.mp3  # Game background music
│   └── fall-woods-bg.jpg  # Background image
│
├── assets/
│   ├── backgrounds/
│   │   └── fall-woods-bg.jpg  # Optimized background
│   └── clash-icons/       # Game icons (9 PNG files)
│
├── README.md              # Project documentation
├── MUSIC-SETUP.md         # Music setup instructions
├── GITHUB-SETUP.md        # GitHub setup guide
└── .gitignore             # Git ignore rules
```

## Path Structure

All paths are **relative** to the root directory, making the project portable:

- **CSS**: `CSS/style.css`, `CSS/game.css`
- **JavaScript**: `js/main.js`, `js/background-music.js`, etc.
- **Images**: `images/headshot.jpg`, `images/soccer/soccer-1.jpg`, etc.
- **Videos**: `videos/IMG_5708.MOV`, `files/video.MOV`
- **Audio**: `files/background-music.mp3`, `files/game-background-music.mp3`

## GitHub Pages Compatibility

✅ **index.html** is in the root directory (required for GitHub Pages)
✅ All paths are relative (work on GitHub Pages)
✅ No absolute paths or local file references
✅ All assets are organized in folders

## Adding New Files

### To add images:
- Place in `images/` folder
- Use relative path: `images/your-image.jpg`

### To add videos:
- Place in `videos/` or `files/` folder
- Use relative path: `videos/your-video.mp4`

### To add audio:
- Place in `files/` folder
- Use relative path: `files/your-audio.mp3`

## File Size Considerations

⚠️ **Large Files**: Video files (.MOV) are large (70+ MB each)
- GitHub has a 100MB file size limit
- Consider using Git LFS for large files
- Or host videos externally (YouTube, Vimeo) and embed

## Ready for GitHub

The project structure is optimized for:
- ✅ GitHub Pages hosting
- ✅ Easy file insertion
- ✅ Clean organization
- ✅ Relative path compatibility

