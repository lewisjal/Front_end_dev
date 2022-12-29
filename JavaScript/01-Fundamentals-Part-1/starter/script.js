/* let js = "Amazing";
//console.log(40 + 8 + 23 - 10);

console.log('Jonas');
console.log(23);

let firstName = 'Matilda';

console.log(firstName);
console.log(firstName);
console.log(firstName);

let jonas_matilda = 'JM';
let $function = 27;

let person = 'jonas'
let PI = 3.1415;

let myFirstJob = 'Coder';
let myCurrentJob = 'Teacher';

let job1 = 'programmer';
let job2 = 'teacher';

console.log(myFirstJob);

// Variable name convention


true;
// console.log(true)
let javascriptIsFun = true;
console.log(javascriptIsFun)

// console.log(typeof true);
console.log(typeof javascriptIsFun);
// console.log(typeof 23);
// console.log(typeof 'Jonas');

javascriptIsFun = 'YES!'
console.log(typeof javascriptIsFun);

let year;
console.log(year);
console.log(typeof year);

year = 1991;
console.log(typeof year);

console.log(typeof null);


let age = 30;
age = 31;

const birthYear = 1991;
//birthYear = 1990;
//const job;

var job = 'programmer';
job = 'teacher';

lastName = 'Schmedtmann';
console.log(lastName);

*/

// Math operators
/*
const now = 2037;
const ageJonas = now - 1991;
const ageSarah = now - 2018;
console.log(ageJonas, ageSarah);

console.log(ageJonas * 2, ageJonas / 10, 2 ** 3);
//  2 ** 3 means 2 to the power of 3 = 2 * 2 * 2

const firstName = 'Jonas';
const lastName = 'Schmedtmann';

console.log(firstName + ' ' + lastName);

// Assignment operators
let x = 10 + 5;  // x equals 15
x += 10; // x = x + 10 equals 25
x *= 4; // x = x * 4 equals 100
x++; // x = x + 1 equals 101
x--; // x = x - 1 equals 100
x--; // x = x - 1 equals 99
console.log(x);

// Comparison operators
console.log(ageJonas > ageSarah); // >, <, <=, >=
console.log(ageSarah >= 18);

const isFullAge = ageSarah >= 18;

console.log(now - 1991 > now - 2018);


const now = 2037;
const ageJonas = now - 1991;
const ageSarah = now - 2018;

console.log(now - 1991 > now - 2018);

let x, y;
x = y = 25 - 10 - 5; // x = y = 10, x = 10
console.log(x, y);

const averageAge = (ageJonas + ageSarah) / 2
console.log(ageJonas, ageSarah, averageAge);

const firstName = 'Jonas';
const job = 'teacher';
const birthYear = 1991;
const currentYear = 2037;

const jonas = "I'm " + firstName + ', a ' + (currentYear - birthYear) + ' years old ' + job + ' !';
console.log(jonas);

const jonasNew = `I'm ${firstName}, a ${currentYear - birthYear} years old ${job} !`;
console.log(jonasNew);

console.log(`Just a regular string...`)

console.log('String with \n\
multiple \n\
lines')

console.log(`String with
multiple
lines`);


const age = 15;
const isOldEnough = age >= 18;

if (age >= 18) {
    console.log(`Sarah can start getting her drivers license 🚗`)
} else {
    const yearsLeft = 18 - age;
    console.log(`Sarah is too young. Wait another ${yearsLeft} years :)`);
}

const birthYear = 1991;

let century;
if (birthYear <= 2000) {
    century = 20;
} else {
    century = 21;
}
console.log(century)



// Type Conversion
const inputYear = '1991';
console.log(Number(inputYear), inputYear);
console.log(Number(inputYear) + 18);

console.log(Number('Jonas'));
console.log(typeof NaN);

console.log(String(23), 23);

// type coercion
console.log(' I am ' + 23 + ' years old');
console.log('23' + '10' + 3);
console.log('23' / '2');
console.log('23' > '18');

let n = '1' + 1;
n -= 1
console.log(n);



console.log(Boolean(0));
console.log(Boolean(undefined));
console.log(Boolean('Jonas'));
console.log(Boolean({}));

const money = 100;
if (money) {
    console.log(`Don't spend it all ;)`);
} else {
    console.log(`You should get a job!`);
}


let height = 0;
if (height) {
    console.log(`YAY Height is defined!`)
} else {
    console.log("HEIGHT is undefined")
}



const age = '18';
if (age === 18) console.log(`You just became an adult! :D (strict)`);

if (age == 18) console.log(`You just became an adult! :D (loose)`);

const favorite = Number(prompt("What's your favorite number?"));
console.log(favorite);
console.log(typeof favorite);

if (favorite === 23) {  // 23 == 23 --> FALSE
    console.log(`Cool! 23 is an amazing number!`);
} else if (favorite === 7) {
    console.log(`7 is also a cool number!`)
} else if (favorite === 9) {
    console.log(`9 is also a cool number`)
} else {
    console.log('Number is not 23 or 7')
}

if (favorite !== 23) console.log(`Why not 23?`);


const hasDriversLicense = true;
const hasGoodVision = true;

console.log(hasDriversLicense && hasGoodVision);
console.log(hasDriversLicense || hasGoodVision);
console.log(!hasDriversLicense);


// if (hasDriversLicense && hasGoodVision) {
//     console.log(`Sarah is able to drive!`)
// } else {
//     console.log('Someone else should drive...')
// }

const isTired = false; //C
console.log(hasDriversLicense && hasGoodVision && isTired);

if (hasDriversLicense && hasGoodVision && !isTired) {
    console.log(`Sarah is able to drive!`)
} else {
    console.log('Someone else should drive...')
}



const day = 'Saturday';

switch (day) {
    case 'Monday': //day === 'Monday'
        console.log(`Plan course structure`);
        console.log(`Go to coding meetup`);
        break;
    case 'Tuesday':
        console.log(`Prepare theory videos`);
        break;
    case 'Wednesday':
    case 'Thursday':
        console.log(`Write code examples`);
        break;
    case 'Friday':
        console.log(`Record videos`);
        break;
    case 'Saturday':
    case 'Sunday':
        console.log(`Enjoy the weekend`)
        break;
    default:
        console.log(`Not a valid day`);
}

if (day === 'Monday') {
    console.log(`Plan course structure`);
    console.log(`Go to coding meetup`);
} else if (day === 'Tuesday') {
    console.log(`Prepare theory videos`);
} else if (day === `Wednesday` || day === `Thursday`) {
    console.log(`Write code examples`);
} else if (day === 'Friday') {
    console.log('Record Videos');
} else if (day === 'Saturday' || 'Sunday') {
    console.log('Enjoy the weekend');
} else {
    console.log(`Not a valid day`);
}


3 + 4;
1991;
true && false && !false;

if (23 > 10) {
    const str = `23 is bigger`;
}

console.log(`I'm ${2037 - 1991} years old ${if (23 > 10) {
    const str = `23 is bigger`;
}}`);

*/

const age = 23;
age >= 18 ? console.log(`I like to drink wine 🍷`) : console.log(`I like to drink water 💧`);

const drink = age >= 18 ? `wine 🍷` : `water 💧`;
console.log(drink);

let drink2;
if (age >= 18) {
    drink2 = `wine 🍷`;
} else {
    drink2 = `water 💧`;
}
console.log(drink2);

console.log(`I like to drink ${drink}`);

