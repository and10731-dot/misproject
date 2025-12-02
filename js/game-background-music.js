// js/game-background-music.js - Calm background music for game page only

(function() {
  'use strict';

  // Wait for DOM to be ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initGameMusic);
  } else {
    initGameMusic();
  }

  function initGameMusic() {
    const gameMusic = document.getElementById('gameBackgroundMusic');
    const gameMusicBtn = document.getElementById('gameMusicControl');
    
    if (!gameMusic || !gameMusicBtn) {
      console.warn('Game music elements not found');
      return;
    }

    let isPlaying = false;
    let userInteracted = false;

    // Update button icon
    function updateButtonIcon() {
      if (gameMusic.muted || !isPlaying) {
        gameMusicBtn.textContent = '🔇';
        gameMusicBtn.setAttribute('aria-pressed', 'true');
        gameMusicBtn.title = 'Click to unmute game music';
      } else {
        gameMusicBtn.textContent = '🔊';
        gameMusicBtn.setAttribute('aria-pressed', 'false');
        gameMusicBtn.title = 'Click to mute game music';
      }
    }

    // Try to play music (may be blocked by browser autoplay policy)
    function tryPlayMusic() {
      if (!userInteracted) return;
      
      const playPromise = gameMusic.play();
      if (playPromise !== undefined) {
        playPromise
          .then(() => {
            isPlaying = true;
            gameMusic.muted = false;
            updateButtonIcon();
          })
          .catch(error => {
            console.log('Game music autoplay prevented:', error);
            // Music will start when user clicks the button
          });
      }
    }

    // Handle button click
    gameMusicBtn.addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      userInteracted = true;

      if (gameMusic.muted || !isPlaying) {
        // Unmute and play
        gameMusic.muted = false;
        const playPromise = gameMusic.play();
        if (playPromise !== undefined) {
          playPromise
            .then(() => {
              isPlaying = true;
              updateButtonIcon();
            })
            .catch(error => {
              console.error('Error playing game music:', error);
            });
        }
      } else {
        // Mute
        gameMusic.muted = true;
        updateButtonIcon();
      }
    });

    // Start music when user interacts with game (clicks start button or first tile)
    const startBtn = document.getElementById('startBtn');
    if (startBtn) {
      startBtn.addEventListener('click', function() {
        userInteracted = true;
        tryPlayMusic();
      });
    }

    // Also start when first tile is clicked
    const gameGrid = document.getElementById('gameGrid');
    if (gameGrid) {
      gameGrid.addEventListener('click', function() {
        if (!userInteracted) {
          userInteracted = true;
          tryPlayMusic();
        }
      }, { once: true });
    }

    // Initialize button state
    updateButtonIcon();
    
    // Set initial volume (calm music should be at moderate volume)
    gameMusic.volume = 0.4;
  }
})();

