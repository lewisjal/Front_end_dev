'use strict';

// Selecting elements
const player0EL = document.querySelector('.player--0');
const player1EL = document.querySelector('.player--1');
const score0El = document.querySelector('#score--0');
const score1El = document.getElementById('score--1');
const current0El = document.getElementById('current--0');
const current1El = document.getElementById('current--1');
const diceEl = document.querySelector('.dice');
const btnNew = document.querySelector('.btn--new');
const btnRoll = document.querySelector('.btn--roll');
const btnHold = document.querySelector('.btn--hold');

let scores, currentScore, activePlayer, playing;
// Starting conditions
// score0El.textContent = 0;
// score1El.textContent = 0;
const init = function () {
  playing = true;
  score0El.textContent = 0;
  score1El.textContent = 0;
  current0El.textContent = 0;
  current1El.textContent = 0;
  currentScore = 0;
  activePlayer = 0;
  scores = [0, 0];
  diceEl.classList.add('hidden');
  document.getElementById(`score--${activePlayer}`).textContent =
    scores[activePlayer];
  player0EL.classList.add('player--active');
  player1EL.classList.remove('player--active');
};

init();

const switchPlayer = function () {
  document.getElementById(`current--${activePlayer}`).textContent = 0;
  activePlayer = activePlayer === 0 ? 1 : 0;
  currentScore = 0;
  player0EL.classList.toggle('player--active');
  player1EL.classList.toggle('player--active');
};

// rolling dice functionality
btnRoll.addEventListener('click', function () {
  if (playing) {
    // 1. Generating a random dice roll
    const dice = Math.trunc(Math.random() * 6) + 1;
    console.log(dice);
    // 2. Display dice
    diceEl.classList.remove('hidden');
    diceEl.src = `dice-${dice}.png`;

    // 3. Check for a rolled 1
    if (dice !== 1) {
      // Add dice to current score
      currentScore += dice;
      document.getElementById(`current--${activePlayer}`).textContent =
        currentScore;
    } else {
      // move to next player
      // document.getElementById(`current--${activePlayer}`).textContent = 0;
      // activePlayer = activePlayer === 0 ? 1 : 0;
      // currentScore = 0;
      // player0EL.classList.toggle('player--active');
      // player1EL.classList.toggle('player--active');
      switchPlayer();
    }
  }
});

btnHold.addEventListener('click', function () {
  if (playing) {
    // 1) Add current score to score of active player
    scores[activePlayer] += currentScore;
    console.log('Active player', activePlayer);
    document.getElementById(`score--${activePlayer}`).textContent =
      scores[activePlayer];

    //2) Check if score is = 100
    if (scores[activePlayer] >= 100) {
      playing = false;
      diceEl.classList.add('hidden');
      document
        .querySelector(`.player--${activePlayer}`)
        .classList.add('player--winner');
      document
        .querySelector(`.player--${activePlayer}`)
        .classList.remove('player--active');
      // finsh the game
      //3)Switch to the next player
    } else {
      switchPlayer();
    }
  }
});

btnNew.addEventListener('click', function () {
  init();
  //   playing = true;
  //   score0El.textContent = 0;
  //   score1El.textContent = 0;
  //   current0El.textContent = 0;
  //   current1El.textContent = 0;
  //   currentScore = 0;
  //   activePlayer = 0;
  //   scores = [0, 0];
  //   console.log(scores[activePlayer]);
  //   console.log(
  //     (document.getElementById(`score--${activePlayer}`).textContent =
  //       scores[activePlayer])
  //   );
  //   player0EL.classList.add('player--active');
  //   player1EL.classList.remove('player--active');
  document.querySelector(`.player--0`).classList.remove('player--winner');
  document.querySelector(`.player--1`).classList.remove('player--winner');
  diceEl.classList.add('hidden');
});
