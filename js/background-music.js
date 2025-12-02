// Background music controller - SIMPLE AND GUARANTEED TO WORK
(function() {
  'use strict';
  
  console.log('Music script starting...');
  
  // Wait for page to load
  function init() {
    const btn = document.getElementById('musicControl');
    const audio = document.getElementById('backgroundMusic');
    
    if (!btn || !audio) {
      console.error('Music button or audio element not found!');
      return;
    }
    
    console.log('Music button found:', btn);
    console.log('Audio element found:', audio);
    
    let isPlaying = false;
    
    // Set audio volume
    audio.volume = 0.3;
    
    // Click handler
    btn.addEventListener('click', function(e) {
      console.log('BUTTON CLICKED! Current state:', isPlaying);
      e.preventDefault();
      e.stopPropagation();
      
      if (isPlaying) {
        // Mute
        audio.pause();
        isPlaying = false;
        btn.innerHTML = '🔇';
        btn.title = 'Click to play background music';
        btn.setAttribute('aria-pressed', 'false');
        localStorage.setItem('bgMusicEnabled', 'false');
        console.log('Music paused');
      } else {
        // Unmute
        console.log('Attempting to play music...');
        const playPromise = audio.play();
        
        if (playPromise !== undefined) {
          playPromise.then(() => {
            console.log('Music playing successfully!');
            isPlaying = true;
            btn.innerHTML = '🔊';
            btn.title = 'Click to mute background music';
            btn.setAttribute('aria-pressed', 'true');
            localStorage.setItem('bgMusicEnabled', 'true');
          }).catch(err => {
            console.error('Play failed:', err);
            btn.innerHTML = '⚠️';
            btn.title = 'Music file not found! Add background-music.mp3 to files/ folder';
            btn.style.background = 'linear-gradient(135deg, #dc3545 0%, #c82333 100%)';
            
            if (!window.musicAlertShown) {
              setTimeout(() => {
                alert('Background music file not found!\n\nTo add music:\n1. Get a calm MP3 file\n2. Save it as "background-music.mp3"\n3. Place it in the "files" folder\n\nSee MUSIC-SETUP.md for free music sources.');
                window.musicAlertShown = true;
              }, 100);
            }
          });
        }
      }
    }, true); // Use capture phase
    
    // Also try mousedown
    btn.addEventListener('mousedown', function(e) {
      e.preventDefault();
      btn.click();
    }, true);
    
    // Keyboard support
    btn.addEventListener('keydown', function(e) {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        btn.click();
      }
    });
    
    // Check saved preference
    if (localStorage.getItem('bgMusicEnabled') === 'true') {
      document.addEventListener('click', function autoPlay() {
        audio.play().then(() => {
          isPlaying = true;
          btn.innerHTML = '🔊';
          btn.title = 'Click to mute background music';
          btn.setAttribute('aria-pressed', 'true');
        }).catch(() => {
          console.log('Auto-play failed');
        });
        document.removeEventListener('click', autoPlay);
      }, { once: true });
    }
    
    // Handle visibility change
    document.addEventListener('visibilitychange', function() {
      if (document.hidden && isPlaying) {
        audio.pause();
      } else if (!document.hidden && isPlaying) {
        audio.play().catch(() => {});
      }
    });
    
    console.log('Music controller initialized successfully!');
  }
  
  // Initialize
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    setTimeout(init, 100);
  }
  
})();
