'use strict';

// Data needed for a later exercise
const flights =
  '_Delayed_Departure;fao93766109;txl2133758440;11:25+_Arrival;bru0943384722;fao93766109;11:45+_Delayed_Arrival;hel7439299980;fao93766109;12:05+_Departure;fao93766109;lis2323639855;12:30';

// Data needed for first part of the section

const getCode = str => str.slice(0, 3).toUpperCase();

for (const flight of flights.split('+')) {
  const [type, from, to, time] = flight.split(';');
  const output = `${type.startsWith('_Delayed') ? '🛑' : ''}${type.replaceAll(
    '_',
    ' '
  )} from ${getCode(from)} to ${getCode(to)} (${time.replace(
    ':',
    'h'
  )})`.padStart(45);
  console.log(output);
}

/*
const weekdays = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
const openingHours = {
  [weekdays[3]]: {
    open: 12,
    close: 22,
  },
  [weekdays[4]]: {
    open: 11,
    close: 23,
  },
  [weekdays[5]]: {
    open: 0, // Open 24 hours
    close: 24,
  },
};

const restaurant = {
  name: 'Classico Italiano',
  location: 'Via Angelo Tavanti 23, Firenze, Italy',
  categories: ['Italian', 'Pizzeria', 'Vegetarian', 'Organic'],
  starterMenu: ['Focaccia', 'Bruschetta', 'Garlic Bread', 'Caprese Salad'],
  mainMenu: ['Pizza', 'Pasta', 'Risotto'],

  // Before ES6
  // openingHours: openingHours,

  //ES6 enhance object literals
  openingHours,

  // openingHours: {
  //   thu: {
  //     open: 12,
  //     close: 22,
  //   },
  //   fri: {
  //     open: 11,
  //     close: 23,
  //   },
  //   sat: {
  //     open: 0, // Open 24 hours
  //     close: 24,
  //   },
  // },
  // Before ES6
  // order: function (starterIndex, mainIndex) {
  //   return [this.starterMenu[starterIndex], this.mainMenu[mainIndex]];
  // },

  //After ES6
  order(starterIndex, mainIndex) {
    return [this.starterMenu[starterIndex], this.mainMenu[mainIndex]];
  },

  orderDelivery({ starterIndex = 1, mainIndex = 0, time = '20:00', address }) {
    console.log(
      `Order received! ${this.starterMenu[starterIndex]} and ${this.mainMenu[mainIndex]} will be delivered to ${address} at ${time}`
    );
  },

  orderPasta(ing1, ing2, ing3) {
    console.log(`Here is your delicious pasta with ${ing1}, ${ing2}, ${ing3}`);
  },

  orderPizza(mainIngredient, ...otherIngredients) {
    console.log(mainIngredient);
    console.log(otherIngredients);
  },
};

// Split and Join
console.log('a+very+nice+string'.split('+'));
console.log('Jonas Schmedtmann'.split(' '));

const [firstName, lastName] = 'Jonas Schmedtmann'.split(' ');
console.log(firstName);

const newName = ['Mr.', firstName, lastName.toUpperCase()].join(' ');
console.log(newName);

const capitalizeName = function (name) {
  const names = name.split(' ');
  const namesUpper = [];

  for (const n of names) {
    // namesUpper.push(n[0].toUpperCase() + n.slice(1));
    namesUpper.push(n.replace(n[0], n[0].toUpperCase()));
    console.log(n);
  }
  console.log(namesUpper.join(' '));
};

capitalizeName('jessica ann smith davis');
capitalizeName('jalin lewis');

//Padding
const message = 'Go to gate 23!';
console.log(message.padStart(20, '+').padEnd(30, '+'));
console.log('Jonas'.padStart(20, '+').padEnd(30, '+'));

const maskCreditCard = function (number) {
  const str = number + '';
  const last = str.slice(-4);
  return last.padStart(str.length, '*');
};

console.log(maskCreditCard(22362234));
console.log(maskCreditCard(22362248584979376));
console.log(maskCreditCard('256547355785463875'));

// Repeat method

const message2 = 'Bad weather... All departures delayed ';
console.log(message2.repeat(5));

const planesInLine = function (n) {
  console.log(`There are ${n} planes in line ${'🛫'}`.repeat(n));
};

planesInLine(5);
planesInLine(3);
planesInLine(12);
/*
/////////////////////////////////////////////////////////////////////////////////////////////
//Working with strings - part 2

const airline = 'TAP Delta Lines';

console.log(airline.toLowerCase());
console.log(airline.toUpperCase());

// Fix capitalization in name
const passenger = 'jOnAS'; //Jonas
const passengerLower = passenger.toLowerCase();
const passengerCorrect =
  passengerLower[0].toUpperCase() + passengerLower.slice(1);
console.log(passengerCorrect);

// Comparing emails
const email = 'hello@jonas.io';
const loginEmail = '  Hello@Jonas.Io \n';

// const lowerEmail = loginEmail.toLowerCase();
// const trimmedEmail = lowerEmail.trim();
const normalizedEmail = loginEmail.toLowerCase().trim();
console.log(normalizedEmail);
console.log(email === normalizedEmail);

// replacing parts of strings
const priceGB = '288,97£';
const priceUS = priceGB.replace('£', '$').replace(',', '.');
console.log(priceUS);

const announcement =
  'All passengers come to boarding door 23. Boarding door 23!';
console.log(announcement.replace('door', 'gate'));
// console.log(announcement.replaceAll('door', 'gate'));
console.log(announcement.replace(/door/g, 'gate'));

// Boolean
const plane = 'Airbus A320neo';
console.log(plane.includes('A320'));
console.log(plane.includes('Boeing'));
console.log(plane.startsWith('Air'));

if (plane.startsWith('Airbus') && plane.endsWith('neo')) {
  console.log('Part of the NEW airbus family');
}

// Practice exercise
const checkBaggage = function (items) {
  const baggage = items; //.toLowerCase();
  if (baggage.includes('knife') || baggage.includes('gun')) {
    console.log('You are NOT allowed on board');
  } else {
    console.log('Welcome aboard!');
  }
};

checkBaggage(' I have a laptop, some Food, and a pocket Knife');
checkBaggage('Socks and camera');
checkBaggage('Got some snacks and a gun for protection');

////////////////////////////////////////////////////////////////////////////////////////////

// Working with strings part - 1
const airline = 'TAP Delta Airlines';
const plane = 'A320';

console.log(plane[0]);
console.log(plane[1]);
console.log(plane[2]);
console.log(plane[3]);
console.log('B737'[0]);

console.log(airline.length);
console.log('B737'.length);

console.log(airline.indexOf('l'));
console.log(airline.lastIndexOf('l'));
console.log(airline.indexOf('Delta')); //case sensitive

console.log(airline.slice(4));
console.log(airline.slice(4, 9));

console.log(airline.slice(0, airline.indexOf(' ')));
console.log(airline.slice(airline.lastIndexOf(' ') + 1));

console.log(airline.slice(-2));
console.log(airline.slice(1, -1));

const checkMiddleSeat = function (seat) {
  // B and E are middle seats
  const s = seat.slice(-1);

  if (s === 'B' || s === 'E') {
    console.log('You got the middle seat 😔');
  } else {
    console.log('You got lucky! 😄');
  }
};

checkMiddleSeat('12E');
checkMiddleSeat('3B');
checkMiddleSeat('23C');

console.log(new String('Jonas'));
console.log(typeof new String('Jonas'));

console.log(typeof new String('Jonas').slice());

///////////////////////////////////////////////////////////////////////////////////////////////////////

// Map: Iteration
const quiz = new Map([
  ['question', 'What is the best programming language in the world?'],
  [1, 'C'],
  [2, 'Java'],
  [3, 'JavaScript'],
  ['correct', 3],
  [true, 'Correct! 🎉'],
  [false, 'Try again.'],
]);

console.log(quiz);

// COnvert object to map
console.log(Object.entries(openingHours));
const hoursMap = new Map(Object.entries(openingHours));
console.log(hoursMap);

// Quiz map
console.log(quiz.get('question'));
for (const [key, value] of quiz) {
  if (typeof key === 'number') console.log(`Answer ${key}: ${value}`);
}

const answer = 3;
// Number(
// prompt(`Your answer?
// 1)
// 2)
// 3)');
console.log(answer);

// quiz.get(quiz.get('correct') === answer);
console.log(quiz.get(quiz.get('correct') === answer));

// Convert map
console.log(...quiz);
// console.log(quiz.entries());
console.log(quiz.keys());
console.log(quiz.values());

// const correctAnswer = answer === 3 ? quiz.get(true) : quiz.get(false);
// console.log(correctAnswer);

////////////////////////////////////////////////////////////////////////////////////////////////////
// Maps: Fundamentals
const rest = new Map();
rest.set('name', 'Classico Italiano');
rest.set(1, 'Firenze, Italy');
console.log(rest.set(2, 'Lisbon, Portugal'));

rest
  .set('categories', ['Italian', 'Pizzeria', 'Vegetarian', 'Organic'])
  .set('open', 11)
  .set('close', 23)
  .set(true, 'We are open =)')
  .set(false, 'We are closed :(');

console.log(rest.get('name'));
console.log(rest.get(true));
console.log(rest.get(1));

const time = 22;
console.log(rest.get(time > rest.get('open') && time < rest.get('close')));

console.log(rest.has('categories'));
rest.delete(2);
// rest.clear();

const arr = [1, 2];
rest.set(arr, 'Test');
rest.set(document.querySelector('h1'), 'Heading');
rest.set;
console.log(rest);
console.log(rest.size);

console.log(rest.get(arr));
// const time = 22;
// console.log(rest.get(time > rest.get('open') ? rest.get(true) : rest.get(false));

// ///////////////////////////////////////////////////////////////////////////////////////////////
// Sets
const orderSet = new Set([
  'Pasta',
  'Pizza',
  'Pizza',
  'Risotto',
  'Pasta',
  'Pizza',
]);
console.log(orderSet);

console.log(new Set('Jonas'));

console.log(orderSet.size);

console.log(orderSet.has('Pizza'));
console.log(orderSet.has('Bread'));
orderSet.add('Garlic Bread');
orderSet.add('Garlic Bread');
orderSet.delete('Risotto');
// orderSet.clear();
console.log(orderSet);

for (const orders of orderSet) console.log(orders);

//Example
const staff = ['Waiter', 'Chef', 'Waiter', 'Manager', 'Chef', 'Waiter'];
const staffUnique = [...new Set(staff)];
console.log(staffUnique);
console.log(new Set(staff).size);

console.log(new Set('jonasschmedtmann').size);

/////////////////////////////////////////////////////////////////////////////////////////////////

// Property NAMES
const properties = Object.keys(openingHours);
console.log(properties);

let openStr = `We are open ${properties.length} day(s) a week: `;
for (const day of properties) {
  openStr += `${day}, `;
}
console.log(openStr);

// Property: VALUES
const values = Object.values(openingHours);
console.log(values);

//Object looping
const entries = Object.entries(openingHours);
console.log(entries);

// FOr simpler destructuring [key, value]
for (const [key, { open, close }] of entries)
  console.log(`On ${key} we open at ${open} and close at ${close}`);

////////////////////////////////////////////////////////////////////
// Optional Chaining
if (restaurant.openingHours && restaurant.openingHours.mon)
  console.log(restaurant.openingHours.mon.open);

// console.log(restaurant.openingHours.mon.open);

// With optional chaining
console.log(restaurant.openingHours.mon?.open);
console.log(restaurant.openingHours?.mon?.open);

// Example
const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

for (const day of days) {
  const open = restaurant.openingHours[day]?.open ?? 'closed';
  console.log(`On ${day}, we open at ${open}`);
}

// Methods
console.log(restaurant.order?.(0, 1) ?? 'Method does not exist');
console.log(restaurant.orderRisotto?.(0, 1) ?? 'Method does not exist');
// Without the optional chaining get "Error: ....not a function"
// console.log(restaurant.orderRisotto(0, 1) ?? 'Method does not exist');

// Arrays
const users = [{ name: 'Jonas', email: 'hello@jonas.io' }];
// const users = [];
console.log(users[0]?.name ?? 'User array empty');

if (users.length > 0) console.log(users[0].name);
else console.log('User array empty');

//////////////////////////////////////////////////////////////////////////////////
/*
// The for-of loop
const menu = [...restaurant.starterMenu, ...restaurant.mainMenu];

for (const item of menu) console.log(item);

for (const [i, el] of menu.entries()) console.log(`${i + 1} : ${el}`);

// console.log([...menu.entries()]);



// ///////////////////////////////////////////////////////////////////


//resturant.numGuests = 0
restaurant.numGuests = 0;
const guests = restaurant.numGuests || 10;
console.log(guests);

//Nullish: null and undefined (NOT 0 or '')
const guestCorrect = restaurant.numGuests ?? 10;
console.log(guestCorrect);


console.log('---- OR ----');
// Use ANY data type, return ANY data type, short-circuiting
console.log(3 || 'Jonas');
console.log('' || 'Jonas');
console.log(true || 0);
console.log(undefined || null);

console.log(undefined || 0 || '' || 'Hello' || 23 || null);

restaurant.numGuests = 0;
const guests1 = restaurant.numGuests ? restaurant.numGuests : 10;
console.log(guests1);

const guests2 = restaurant.numGuests || 10;
console.log(guests2);

console.log('---- AND ----');
console.log(0 && 'Jonas');
console.log(7 && 'Jonas');

console.log('Hello' && 23 && null && 'Jonas');

if (restaurant.orderPizza) {
  restaurant.orderPizza('mushrooms', 'spinach');
}

restaurant.orderPizza && restaurant.orderPizza('mushrooms', 'spinach');

/////////////////////////////////////////////////////////////////////
// Rest patterns and parameters
// DESTRUCTURING

// SPREAD because on RIGHT side of the assignment operator
const arr = [1, 2, ...[3, 4]];

// REST because on LEFT side of the assignment operator
const [a, b, ...others] = [1, 2, 3, 4, 5];
console.log(a, b, others);

const [pizza, , Risotto, ...otherFood] = [
  ...restaurant.mainMenu,
  ...restaurant.starterMenu,
];

console.log(pizza, Risotto, otherFood);

// Objects
const { sat, ...weekdays } = restaurant.openingHours;
console.log(weekdays);

// FUCNTIONS
const add = function (...numbers) {
  let sum = 0;
  for (let i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  console.log(numbers);
  console.log(sum);
};
add(2, 3);
add(5, 3, 7, 2);
add(8, 2, 5, 3, 2, 1, 4);

const x = [23, 5, 7];
add(...x);

restaurant.orderPizza('mushrooms', 'olives', 'onion', 'spinach');
estaurant.orderPizza('mushrooms');

//////////////////////////////////////////////////////////////////

restaurant.orderDelivery({
  time: '22:30',
  address: 'Via del Sole, 21',
  mainIndex: 2,
  starterIndex: 2,
})

restaurant.orderDelivery({
  address: 'Via del Sole, 21',
  starterIndex: 1,
})

const {name, openingHours, categories} = restaurant;
console.log(name, openingHours, categories);

const {name: restaurantName, openingHours: hours, categories: tags} = restaurant;
console.log(restaurantName, hours, tags);

// Default values
const {menu = [], starterMenu: starters = []} = restaurant;
console.log(menu, starters);

// Mutating variables
let a = 111;
let b = 999;
const obj = {a: 23, b: 17, c: 14};
({a, b} = obj);
console.log(a, b);

// Nested Objects
const {fri: {open: o, close: c}} = openingHours;
console.log(o, c);


const arr = [7, 8, 9];
const badNewArray = [1,2, arr[0], arr[1], arr[2]];
console.log(badNewArray);

const newArr = [1,2, ...arr];
console.log(newArr);

console.log(...newArr);
console.log(1, 2, 7, 8, 9);

const newMenu = [...restaurant.mainMenu, 'Gnocci']
console.log(newMenu);

// Copy array
const mainMenuCopy = [...restaurant.mainMenu];

// Join two arrays or more
const wholeMenu = [...restaurant.mainMenu, ...restaurant.starterMenu];
console.log(wholeMenu);

// Iterables: arrays, strings, maps, sets. NOT objects.
const str = 'Jonas'
const letters = [...str, ' ' , 'S.' ];
console.log(letters);
console.log(...str);
// console.log(`${...str} Schmedtmann`);


// const ingredients = [prompt('Let\'s make pasta! Ingredient 1?'), prompt('Ingredient 2?'), prompt('Ingredient 3?')];

// restaurant.orderPasta(ingredients[0], ingredients[1], ingredients[2]);

// restaurant.orderPasta(...ingredients)

// Objects 

const newRestaurant = {foundedIn: '1998', ...restaurant, founder: 'Guiseppe'};
console.log(newRestaurant);

const restaurantCopy = {...restaurant};
restaurantCopy.name = 'Ristorante Roma'
console.log(restaurant.name);
console.log(restaurantCopy.name);

/*
////////////////////////////////////////////////////////////////////////

// Destructring arrays
const arr= [2, 3, 4];
const a = arr[0];
const b = arr[1];
const c = arr[2];

const [x,y,z] = arr;
console.log(x, y, z);
console.log(arr);

let [main, ,secondary] = restaurant.categories;
console.log(main, secondary);

// Switching variables
// const temp = main;
// main = secondary;
// secondary = temp;
// console.log(main, secondary);

[main, secondary] = [secondary, main]
console.log(main, secondary);

// Receive 2 return functions from a function
const [starter, mainCourse] = restaurant.order(2,0);
console.log(starter, mainCourse);

// Nested destructuring
const nested = [2, 4, [5, 6]];
// const [i, , j] = nested;
// console.log(i, j);
const [i , ,[j, k]] = nested;
console.log(i, j, k);

// Default values
const [p = 1, q = 1, r = 1] = [8, 9];
console.log(p, q ,r);

*/
