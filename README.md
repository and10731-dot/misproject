# Bradyn J. Anderson - Professional Portfolio

A professional portfolio website showcasing academic achievements, career interests, hobbies, and an interactive memory game.

## 🌐 Live Website

[View the live site](https://yourusername.github.io/misproject1/) - *Update with your GitHub Pages URL after deployment*

## 📁 Project Structure

```
misproject1/
├── index.html              # Home page (GitHub Pages entry point) ⭐
├── hobbies.html           # Hobbies page
├── discover.html          # UMD and Duluth information
├── resume.html            # Professional resume
├── career.html            # Career interests
├── game.html              # Interactive memory match game
│
├── CSS/
│   ├── style.css          # Main site styles (hunting theme)
│   └── game.css           # Game-specific styles
│
├── js/
│   ├── main.js            # Site navigation and interactions
│   ├── background-music.js      # Site-wide background music
│   ├── game-background-music.js # Game page background music
│   └── memory-game-clash.js     # Memory game logic
│
├── images/
│   ├── headshot.jpg       # Professional headshot
│   ├── soccer/            # Soccer hobby images (3 images)
│   └── hunting-fishing/   # Hunting & fishing images (3 images)
│
├── videos/
│   ├── IMG_5708.MOV       # Introduction video (home page)
│   └── umd-marketing-video.MOV # UMD marketing video
│
├── files/
│   ├── video.MOV          # Marketing video (discover page)
│   ├── game-background-music.mp3 # Calm background music for game
│   └── fall-woods-bg.jpg  # Background image
│
└── assets/
    ├── backgrounds/       # Background images
    └── clash-icons/       # Game icon images (9 PNG files)
```

## 🎨 Features

### Website Features
- **Professional Design**: Hunting-themed aesthetic with fall Minnesota woods background
- **Responsive Layout**: Works on desktop, tablet, and mobile devices
- **Background Music**: Calm ambient music with mute/unmute controls
- **Video Content**: Introduction video and UMD marketing video
- **Interactive Game**: Memory match game with Clash Royale characters

### Pages
1. **Home** (`index.html`): Professional introduction, headshot, and welcome video
2. **Hobbies**: Detailed descriptions of soccer, hunting/fishing, and helping others
3. **Discover**: Information about UMD and Duluth
4. **Resume**: Professional resume with download option
5. **Career**: Career interests (CMRA LLC and Minnesota Vikings)
6. **Game**: Interactive memory matching game

## 🚀 Getting Started

### For GitHub Pages

1. **Clone the repository**:
```bash
git clone https://github.com/yourusername/misproject1.git
cd misproject1
```

2. **Enable GitHub Pages**:
   - Go to repository Settings
   - Click "Pages" in the left sidebar
   - Select "main" branch and "/ (root)" folder
   - Click "Save"
   - Your site will be available at: `https://YOUR_USERNAME.github.io/misproject1/`

### For Local Development

1. Open `index.html` in your web browser, or use a local server:
```bash
# Using Python
python -m http.server 8000

# Using Node.js (http-server)
npx http-server
```

2. Navigate to `http://localhost:8000` in your browser

## 📝 File Paths

All paths are **relative** to the root directory, making the project portable and GitHub Pages compatible:

- **CSS**: `CSS/style.css`, `CSS/game.css`
- **JavaScript**: `js/main.js`, `js/background-music.js`, etc.
- **Images**: `images/headshot.jpg`, `images/soccer/soccer-1.jpg`, etc.
- **Videos**: `videos/IMG_5708.MOV`, `files/video.MOV`
- **Audio**: `files/background-music.mp3`, `files/game-background-music.mp3`

## 📦 Adding New Files

### To add images:
- Place in `images/` folder
- Use relative path: `images/your-image.jpg`

### To add videos:
- Place in `videos/` or `files/` folder
- Use relative path: `videos/your-video.mp4`

### To add audio:
- Place in `files/` folder
- Use relative path: `files/your-audio.mp3`

## ⚠️ Important Notes

### Video Files
- Videos are in `.MOV` format (large files, 70+ MB each)
- For best browser compatibility, convert to `.mp4` format
- HTML already supports both formats with fallbacks
- **GitHub file size limit**: 100MB per file
- Consider using Git LFS for large video files

### Browser Compatibility
- `.MOV` files work best in Chrome or Edge
- Firefox has limited `.MOV` support
- For universal support, convert videos to `.mp4`

## 🛠️ Technologies Used

- HTML5
- CSS3 (Flexbox, Grid, Animations, Backdrop Filters)
- JavaScript (ES6)
- No frameworks or dependencies

## 📄 License

This project is for personal/educational use.

## 👤 Author

**Bradyn J. Anderson**
- University of Minnesota Duluth
- Sales Major
- Email: AND10731@d.umn.edu

## 📚 Documentation

- `PROJECT-STRUCTURE.md` - Detailed file structure
- `GITHUB-SETUP.md` - GitHub setup instructions
- `MUSIC-SETUP.md` - Background music setup

## 🙏 Acknowledgments

- University of Minnesota Duluth
- Clash Royale for game icons
- Free music resources for background music
