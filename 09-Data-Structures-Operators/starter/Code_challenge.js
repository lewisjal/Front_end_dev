// Coding challene #1

const game = {
  team1: 'Bayern Munich',
  team2: 'Borrussia Dortmund',
  players: [
    [
      'Neuer',
      'Pavard',
      'Martinez',
      'Alaba',
      'Davies',
      'Kimmich',
      'Goretzka',
      'Coman',
      'Muller',
      'Gnarby',
      'Lewandowski',
    ],
    [
      'Burki',
      'Schulz',
      'Hummels',
      'Akanji',
      'Hakimi',
      'Weigl',
      'Witsel',
      'Hazard',
      'Brandt',
      'Sancho',
      'Gotze',
    ],
  ],
  score: '4:0',
  scored: ['Lewandowski', 'Gnarby', 'Lewandowski', 'Hummels'],
  date: 'Nov 9th, 2037',
  odds: {
    team1: 1.33,
    x: 3.25,
    team2: 6.5,
  },
};
/*
// Create an array of players for the data seet
[players1, players2] = game.players;

// For BayerMunich create goalkeeper and field players
[gk, ...fieldPlayers] = players1;
console.log(gk, fieldPlayers);

// Create an array for all 22 players
const allPlayers = [...players1, ...players2];
console.log(allPlayers);

//Bayer used 3 sustitute player, create array for final bayer player roster
const players1Final = [...players1, 'Thiago', 'Coutinho', 'Perisic'];
console.log(players1Final);

// Based on odds create 3 variables
({ team1 = 0, x: draw = 0, team2 = 0 } = game.odds);
console.log(game.odds);
console.log(team1, draw, team2);

// Need a function that will return an arbitrary numbers of player and goals made
const printGoals = function (...names) {
  let sum = 0;
  for (i = 0; i <= names.length; i++) {
    totalGoals = sum + i;
  }

  console.log(...names);
  console.log(`${totalGoals} goals were scored`);
};
printGoals(...game.scored);

// Print team most likely to win without if/else statment or ternary operation
team1 < team2 && console.log('Team 1 is more likely to win');
team1 > team2 && console.log('Team 2 is more likely to win');

////////////////////////////////////////////////////////////////////////////

// Coding Challenge #2

// Get to print the goals scored by each person in scored array
const goalScored = Object.entries(game.scored);
for (const [goals, player] of goalScored) {
  console.log(`Goal ${Number(goals) + 1}: ${player}`);
}

// Calculate average old
const odds = Object.values(game.odds);
console.log(odds);
let sum = 0;
for (i = 0; i < odds.length; i++) {
  sum += odds[i];
  average1 = sum / odds.length;
}
console.log(`The average odd is: ${average1}`);

// Using object looping
let average = 0;
for (const odd of odds) {
  average += odd;
}
average = average / odds.length;
console.log(average);

// Print a nice string
const newOdds = Object.entries(game.odds);
for (let [team, odd] of newOdds) {
  const teamStr = team === 'x' ? 'draw' : `victory ${game[team]}`;
  console.log(`Odd of victory ${teamStr} : ${odd}`);
}
*/

///////////////////////////////////////////////////////////////////////////////////////////

// Coding Challenge #3

const gameEvents = new Map([
  [17, '⚽ GOAL'],
  [36, '🔁 Substitution'],
  [47, '⚽ GOAL'],
  [61, '🔁 Substitution'],
  [64, '🔶 Yellow card'],
  [69, '🔴 Red card'],
  [70, '🔁 Substitution'],
  [72, '🔁 Substitution'],
  [76, '⚽ GOAL'],
  [80, '⚽ GOAL'],
  [92, '🔶 Yellow card'],
]);

// Create array of 'events' of different events that happened, no duplicates
console.log(gameEvents.values());
const newEvents = new Set([...gameEvents.values()]);
const events = [...newEvents];
console.log(events);

// It was found that event at 64' was wrong call. Remove from map of events
gameEvents.delete(64);
const adjEvents = gameEvents;

// Create a string that says "An event happened,on average, every 9 minutes"
const totalMinutes = 90;
// const keyArray = [...gameEvents.keys()];
// console.log(keyArray);
const average = totalMinutes / gameEvents.size;
console.log(`An event happened, on average, every ${average} minutes`);

// Loop over map and print specific element like: [FIRST HALF] 17: ⚽   GOAL
for (const [key, value] of gameEvents) {
  const half = key <= 45 ? 'FIRST' : 'SECOND';
  console.log(`[${half} HALF] ${key}: ${value}`);
}

//////////////////////////////////////////////////////////////////////////////////

// Coding challenge #4

// Working with string extreme version

// My solution
const camelCase = function (str) {
  const arrayInput = [str];
  for (const [i, n] of arrayInput.entries()) {
    const phraseArray = n.toLowerCase().trim('').split('_');
    const firstWord = [phraseArray[0]];
    const [, ...rest] = [...phraseArray];
    let finalWords = '';
    for (j = 0; j < rest.length; j++) {
      const cases = rest[j];
      finalWords += cases.replace(cases[0], cases[0].toUpperCase());
      console.log(`${firstWord}${finalWords.padEnd(15)}${'✅'.repeat(i + 1)}`);
    }

    // i = true;
    // While (i != false){
    //   '✅' *
  }
};

camelCase('Its_All_Love');

// Jonas solution
document.body.append(document.createElement('textarea'));
document.body.append(document.createElement('button'));

document.querySelector('button').addEventListener('click', function () {
  const text = document.querySelector('textarea').value;
  const rows = text.split('\n');

  for (const [i, row] of rows.entries()) {
    console.log(row);
    const [first, second] = row.toLowerCase().trim(' ').split('_');
    const output = `${first}${second.replace(
      second[0],
      second[0].toUpperCase()
    )}`;
    console.log(`${output.padEnd(20)}${'✅'.repeat(i + 1)}`);
  }
});
