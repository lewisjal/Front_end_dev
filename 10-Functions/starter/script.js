'use strict';
/*

const bookings = [];

const createBooking = function (
  flightNum,
  numPassngers = 1,
  price = 199 * numPassngers
) {
  // ES5
  //   numPassngers = numPassngers || 1;
  //   price = price || 199;

  const booking = {
    flightNum,
    numPassngers,
    price,
  };
  console.log(booking);
  bookings.push(booking);
};

createBooking('LH123');
createBooking('LH123', 2, 800);
createBooking('LH123', 2);
createBooking('LH123', 5);

createBooking('LH123', undefined, 1000);
// console.log(bookings);


const flight = 'LH234';
const jonas = {
  name: 'Jonas Schmedtmann',
  passport: 24739479284,
};

const checkIn = function (flightNum, passenger) {
  flightNum = 'LH999';
  passenger.name = 'Mr. ' + passenger.name;

  if (passenger.passport === 24739479284) {
    alert('Check in');
  } else {
    alert('Wrong passport!');
  }
};

// checkIn(flight, jonas);
// console.log(flight);
// console.log(jonas);

// Same as doing
// const flightNum = flight;
// const passenger = jonas;

const newPassport = function (person) {
  person.passport = Math.trunc(Math.random()) * 100000000000;
};

newPassport(jonas);
checkIn(flight, jonas);


const oneWord = function (str) {
  return str.replace(/ /g, '').toLowerCase();
};

const upperFirstWord = function (str) {
  const [first, ...others] = str.split(' ');
  return [first.toUpperCase(), ...others].join('');
};

// Higher-order function
const transformer = function (str, fn) {
  console.log(`Original string: ${str}`);
  console.log(`Transformed string: ${fn(str)}`);

  console.log(`Transformed by: ${fn.name}`);
};

transformer('Javascript is the best!', upperFirstWord);

transformer('Javascript is the best!', oneWord);

// Javascript uses callback functions all the time
const highFive = function () {
  console.log('👋🏾');
};
document.body.addEventListener('click', highFive);

['Jonas', 'Martha', 'Adam'].forEach(highFive);

*/

/*
const greet = function (greeting) {
  return function (name) {
    console.log(`${greeting} ${name}`);
  };
};

const greeterHey = greet('Hey');
greeterHey('Jonas');
greeterHey('Steven');

greet('Hello')('Jonas');


const lufthansa = {
  airline: 'Lufthansa',
  iataCode: 'LH',
  bookings: [],
  book(flightNum, passName) {
    console.log(
      `${passName} booked a seat on ${this.airline} flight ${this.iataCode}${flightNum}`
    );
    this.bookings.push({ flight: `${this.iataCode}${flightNum}`, passName });
  },
};

lufthansa.book(239, 'Jalin Lewis');
lufthansa.book(635, 'John Smith');
console.log(lufthansa);

const eurowings = {
  airline: 'Eurowings',
  iataCode: 'EW',
  bookings: [],
};

/////////////////////////////////////////////////////////////////////////

const book = lufthansa.book;

// Does not work
// book(23, 'Sarah Williams');

// Call method
book.call(lufthansa, 239, 'Mary Cooper');
console.log(lufthansa);

book.call(eurowings, 23, 'Sarah Williams');
console.log(eurowings);

const swiss = {
  airline: 'Swiss Airlines',
  iataCode: 'LX',
  bookings: [],
};

book.call(swiss, 456, 'Henry Wallington');

// Apply method
const flightData = [456, 'Julia Wallington'];
book.apply(swiss, flightData);

book.call(swiss, ...flightData);
console.log(swiss);

// Bind method
const bookEW = book.bind(eurowings);
const bookLH = book.bind(lufthansa);
const bookLX = book.bind(swiss);

bookEW(23, 'Steven Williams');

const bookEW23 = book.bind(eurowings, 23);
bookEW23('Jason Bourne');
bookEW23('Martha Stewart');

// With event listeners
lufthansa.planes = 300;
lufthansa.buyPlane = function () {
  console.log(this);

  this.planes++;
  console.log(this.planes);
};
// lufthansa.buyPlane();

document
  .querySelector('.buy')
  .addEventListener('click', lufthansa.buyPlane.bind(lufthansa));

// Partial application
const addTax = (rate, value) => value + value * (rate / 100);
console.log(addTax(10, 200));

const addVAT = addTax.bind(null, 23);
// addVAT = value => value + value * (rate / 100);

console.log(addVAT(100));
console.log(addVAT(23));

////////////////////////////////////////////////////////////////////

// Extra practice

// Functions calling functions
const price = function (price) {
  const total = price * 0.08 + price;
  return total;
};

const bill = function (bill, price) {
  console.log(`Here is the bill: $${price(bill)}`);
};

bill(450, price);

// Functions returning functions
const greeting = greeting => name => console.log(`${greeting} ${name}`);

greeting('Hello')('Jalin');

// Bind method: Extra practice
const price2 = function (bill) {
  return function (tax) {
    return bill + bill * (tax / 100);
  };
};

const total = price2(100);
console.log(total(23));

const addVAT2 = bill => tax => console.log(bill + bill * (tax / 100));

addVAT2(100)(23);

const runOnce = function () {
  console.log('This will never run again');
  const isPrivate = 23;
};
runOnce();

// console.log(isPrivate);

// IIFE
(function () {
  console.log('This will never run again');
})();

(() => console.log('This will ALSO never run again'))();

{
  const isPrivate = 23;
  var notPrivate = 23;
}
// console.log(isPrivate);
console.log(notPrivate);


const secureBooking = function () {
  let passengerCount = 0;

  return function () {
    passengerCount++;
    console.log(`${passengerCount} passengers`);
  };
};

const booker = secureBooking();
booker();
booker();
booker();

console.dir(booker);

*/

// Example 1
let f;

const g = function () {
  const a = 23;
  f = function () {
    console.log(a * 2);
  };
};

const h = function () {
  const b = 777;
  f = function () {
    console.log(b * 2);
  };
};

g();
f();

// Re-assigned by h function
h();
f();

// Example 2
const boardPassengers = function (n, wait) {
  const perGroup = n / 3;

  setTimeout(function () {
    console.log(`We are now boarding all ${n} passengers`);
    console.log(`There are 3 groups, each with ${perGroup} passengers`);
  }, wait * 1000);

  console.log(`Will start boarding in ${wait} seconds`);
};

setTimeout(function () {
  console.log('TIMER');
}, 1000);

const perGroup = 1000;
boardPassengers(180, 3);
