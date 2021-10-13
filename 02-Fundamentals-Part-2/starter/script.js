'use strict';

/*
//////////////////////////////////////////////////////////////////////////////////////
let hasDriversLicense = false;
const passTest = true;

if (passTest) hasDriversLicense = true;
if (hasDriversLicense) console.log(`I can drive :D`);

// const interface = 'Audio';
// const private = 534;

//////////////////////////////////////////////////////////////////////////////////////
function logger() {
    console.log(`My name is Jalin`);
}

// calling / running / invoking fucntion
logger();
logger();
logger();

//////////////////////////////////////////////////////////////////////////////////////
function fruitProcessor(apples, oranges) {
    const juice = `Juice with ${apples} apples and ${oranges} oranges`;
    return juice;
}

const appleJuice = fruitProcessor(5, 0);
console.log(appleJuice);

const appleOrangeJuice = fruitProcessor(2, 4);
console.log(appleOrangeJuice);

const num = Number('23');

//////////////////////////////////////////////////////////////////////////////////////
//  Function declaration
function calcAge1(birthYear) {
    return 2037 - birthYear;
}
const age1 = calcAge1(1991);

// Function expression
const calcAge2 = function (birthYear) {
    return 2037 - 1991;
}
const age2 = calcAge2(1991);

console.log(age1, age2);

// Function expression
const calcAge2 = function (birthYear) {
    return 2037 - birthYear;
}

// Arrow function
const calcAge3 = birthYear => 2037 - birthYear;
const age3 = calcAge3(1991);
console.log(age3);

const yearsUntilRetirement = (birthYear, firstName) => {
    const age = 2037 - birthYear;
    const retirement = 65 - age;
    //return retirement;
    return `${firstName} retires in ${retirement} years`;
}

console.log(yearsUntilRetirement(1991, 'Jalin'));
console.log(yearsUntilRetirement(1980, 'Jamal'));

function cutFruitPieces(fruit) {
    return fruit * 4;
}

function fruitProcessor(apples, oranges) {
    const applePieces = cutFruitPieces(apples);
    const orangePieces = cutFruitPieces(oranges);

    const juice = `Juice with ${applePieces} apples and ${orangePieces} oranges`;
    return juice;
}

console.log(fruitProcessor(2, 3));

const calcAge = function (birthYear) {
    return 2037 - birthYear;
}

const yearsUntilRetirement = function (birthYear, firstName) {
    const age = calcAge(birthYear);
    const retirement = 65 - age;

    if (retirement > 0) {
        console.log(`${firstName} retires in ${retirement} years`);
        return retirement;
    } else {
        console.log(`${firstName} has already retired 🎉`);
        return -1;
    }
}
console.log(yearsUntilRetirement(1991, 'Jalin'));
console.log(yearsUntilRetirement(1950, 'Mike'));

//////////////////////////////////////////////////////////////////////////////////////
const friend1 = 'Michael';
const friend2 = 'Steven';
const friend3 = 'Peter';

const friends = ['Michael', 'Steven', 'Peter'];
console.log(friends);

const y = new Array(1991, 1984, 2008, 2020);

console.log(friends[0]);
console.log(friends[2]);

console.log(friends.length);
console.log(friends[friends.length - 1]);

friends[2] = 'Jay';
console.log(friends);
// friends = ['Bob', 'Alice'];

const firstName = 'Jalin'
const jonas = [firstName, 'Lewis', 2037 - 1997, 'manager', friends];
console.log(jonas);
console.log(jonas.length);

// Exercise
const calcAge = function (birthYear) {
    return 2037 - birthYear;
}
const years = [1990, 1967, 2002, 2010, 2018];

const age1 = calcAge(years[0]);
const age2 = calcAge(years[1]);
const age3 = calcAge(years[years.length - 1]);
console.log(age1, age2, age3);

const ages = [calcAge(years[0]), calcAge(years[1]), calcAge(years[years.length - 1])]
console.log(ages);

//////////////////////////////////////////////////////////////////////////////////////
const friends = ['Michael', 'Steven', 'Peter'];

// Add elements
const newLength = friends.push('Jay');
console.log(friends);
console.log(newLength);

friends.unshift('John');
console.log(friends);

// Remove elements
friends.pop(); //Last elements in array
const popped = friends.pop();
console.log(popped);
console.log(friends);

friends.shift(); // First element in array
console.log(friends);

console.log(friends.indexOf('Steven'));
console.log(friends.indexOf('Bob'));

friends.push(23);
console.log(friends.includes('Steven'));
console.log(friends.includes('Bob'));
console.log(friends.includes(23));

if (friends.includes('Steven')) {
    console.log(`You have a friend called Steven`);
}

//////////////////////////////////////////////////////////////////////////////////////
const jonasArray = [
    'Jonas',
    'Schmedtmann',
    2037 - 1991,
    'teacher',
    ['Michael', 'Peter', 'Steven']
];

const jonas = {
    firstName: 'Jonas',
    lastName: 'Schmedtmann',
    age: 2037 - 1991,
    job: 'teacher',
    friends: ['Michael', 'Peter', 'Steven']
}

//////////////////////////////////////////////////////////////////////////////////////
const jonas = {
    firstName: 'Jonas',
    lastName: 'Schmedtmann',
    age: 2037 - 1991,
    job: 'teacher',
    friends: ['Michael', 'Peter', 'Steven']
}
console.log(jonas);

console.log(jonas.lastName);
console.log(jonas['lastName']);

const nameKey = 'Name';
console.log(jonas['first' + nameKey]);
console.log(jonas['last' + nameKey]);

// console.log(jonas.'last' + nameKey]);

const interestedIn = prompt(`What do you want to know about Jonas? Choose between firstName, lastName, age, job and friends`);

if (jonas[interestedIn]) {
    console.log(jonas[interestedIn]);
    console.log(`${jonas.firstName} has ${jonas.friends.length} friends and his best friend is named ${jonas.friends[0]}`)
} else {
    console.log(`Wrong request! Choose between firstName, lastName, age, job and friends`)
}

jonas.location = 'Portugal'
jonas['twitter'] = '@jonasschmedtmann'
console.log(jonas);

// Challenge
// "Jonas has 3 friends and his best friend is names Michael"
console.log(`${jonas.firstName} has ${jonas.friends.length} friends and his best friend is named ${jonas.friends[0]}`)

//////////////////////////////////////////////////////////////////////////////////////
const jonas = {
    firstName: 'Jonas',
    lastName: 'Schmedtmann',
    birthYear: 1991,
    job: 'teacher',
    friends: ['Michael', 'Peter', 'Steven'],
    hasDriversLicense: true,

    // calcAge: function (birthYear) {
    //     return 2037 - birthYear;
    // }

    calcAge: function () {
        this.age = 2037 - this.birthYear;
        return this.age;
    },

    getSummary: function () {
        return `${this.firstName} ${this.lastName} is a ${this.calcAge()} year old ${this.job}. They have ${this.friends.length} friends and they ${this.hasDriversLicense ? `have` : `do not have`} their drivers license`;
    },

};

console.log(jonas.calcAge());

console.log(jonas.age);
console.log(jonas.age);
console.log(jonas.age);
console.log(jonas.getSummary());

// console.log(jonas['calcAge'](1991));


//////////////////////////////////////////////////////////////////////////////////////
// console.log('Lifting weights repition 1 🏋🏾‍♂️');
// console.log('Lifting weights repition 2 🏋🏾‍♂️');
// console.log('Lifting weights repition 3 🏋🏾‍♂️');
// console.log('Lifting weights repition 4 🏋🏾‍♂️');
// console.log('Lifting weights repition 5 🏋🏾‍♂️');
// console.log('Lifting weights repition 6 🏋🏾‍♂️');
// console.log('Lifting weights repition 7 🏋🏾‍♂️');
// console.log('Lifting weights repition 8 🏋🏾‍♂️');
// console.log('Lifting weights repition 9 🏋🏾‍♂️');
// console.log('Lifting weights repition 10 🏋🏾‍♂️');

// for loop keeps running while condition is true
for (let rep = 1; rep <= 30; rep++) {
    console.log(`Lifting weights repition ${rep}🏋🏾‍♂️`);
}


///////////////////////////////////////////////////////////////////
const jonas = [
    'Jonas',
    'Schmedtmann',
    2037 - 1991,
    'teacher',
    ['Michael', 'Peter', 'Steven'],
    true,
];
const types = [];

// console.log(jonas[0])
// console.log(jonas[1])
// ...
// console.log(jonas[4])
// jonas[5] does NOT exist



for (let i = 0; i < jonas.length; i++) {
    // Reading from jonas array
    console.log(jonas[i], typeof jonas[i]);

    // Filling types array
    //types[i] = typeof jonas[i]

    types.push(typeof jonas[i]);
}

console.log(types);

const years = [1991, 2007, 1969, 2020];
const ages = []

for (let i = 0; i < years.length; i++) {
    ages.push(2037 - years[i]);
}

console.log(ages);

// continue and break
console.log('--- ONLY STRING ---')
for (let i = 0; i < jonas.length; i++) {
    if (typeof jonas[i] !== 'string') continue;

    console.log(jonas[i], typeof jonas[i]);
}

console.log('--- BREAK WITH NUMBER ---')
for (let i = 0; i < jonas.length; i++) {
    if (typeof jonas[i] === 'number') break;

    console.log(jonas[i], typeof jonas[i]);
}


//////////////////////////////////////////////////////////////////////////////////////////
const jonas = [
    'Jonas',
    'Schmedtmann',
    2037 - 1991,
    'teacher',
    ['Michael', 'Peter', 'Steven'],
    true
];

// Started with i (index) 0, 1, ..., 4
// Want to go the other way 4, 3, ..., 0

for (let i = jonas.length - 1; i >= 0; i--) {
    console.log(i, jonas[i]);
}

for (let exercise = 1; exercise < 4; exercise++) {
    console.log(`----- Starting exercise ${exercise}`);

    for (let rep = 1; rep < 6; rep++) {
        console.log(`Exercise ${exercise}: Lifting weights repitiion ${rep} 🏋🏾‍♂️`);
    }
}


//////////////////////////////////////////////////////////////////////////////
// for loop keeps running while condition is true

// for (let rep = 1; rep <= 10; rep++) {
//     console.log(`Lifting weights repition ${rep}🏋🏾‍♂️`);
// }

let rep = 1;
while (rep <= 10) {
    // console.log(`WHILE: Lifting weights repition ${rep}🏋🏾‍♂️`);
    rep++;
}

let dice = Math.trunc(Math.random() * 6) + 1;

while (dice !== 6) {
    console.log(`You rolled a ${dice}`);
    dice = Math.trunc(Math.random() * 6) + 1;
    if (dice === 6) console.log(`You rolled a ${dice}, congratulations!`);
}

*/

