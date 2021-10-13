// CODING CHALLENGE #1

// Body mass index formula

/*
let mass;
let height;

let bodyMassIndex = mass / height ** 2;

let markMass = 78; // first data set of Mark mass
let markHeight = 1.69; // first data set of Mark height
let johnMass = 92; // first data set of John mass
let johnHeight = 1.95; // first data set of John height

let bodyMassMark = markMass / markHeight ** 2; // body mass calculation for Mark data set 1
let bodyMassJohn = johnMass / johnHeight ** 2; // body mass calculation for John

console.log(bodyMassMark, bodyMassJohn);

markHigherBMI = bodyMassMark > bodyMassJohn; // boolean to compare BMI between Mark and John

console.log(markHigherBMI);


markMass = 95; //second data set of Mark mass
markHeight = 1.88; // second data set of Mark height
johnMass = 85; // second data set of John mass
johnHeight = 1.76; // second data set of John height

bodyMassMark = markMass / markHeight ** 2; //body mass calculation for Mark data set 2
bodyMassJohn = johnMass / johnHeight ** 2; //bosy mass calculation for John data set 2

console.log(bodyMassMark, bodyMassJohn);

markHigherBMI = bodyMassMark > bodyMassJohn; // boolean to compare BMI between Mark and John

console.log(markHigherBMI);

// End Coding challenge #1



// CODING CHALLENGE #2

let mass;
let height;

let bodyMassIndex = mass / height ** 2;

let markMass = 78; // first data set of Mark mass
let markHeight = 1.69; // first data set of Mark height
let johnMass = 92; // first data set of John mass
let johnHeight = 1.95; // first data set of John height

let bodyMassMark = markMass / markHeight ** 2; // body mass calculation for Mark data set 1
let bodyMassJohn = johnMass / johnHeight ** 2; // body mass calculation for John

if (bodyMassMark > bodyMassJohn) {
    console.log(`Mark's BMI (${bodyMassMark}) is higher than John's (${bodyMassJohn})!`);
} else {
    console.log(`John's BMI (${bodyMassJohn}) is higher than Mark's (${bodyMassMark})!`);
}



markMass = 95; //second data set of Mark mass
markHeight = 1.88; // second data set of Mark height
johnMass = 85; // second data set of John mass
johnHeight = 1.76; // second data set of John height

bodyMassMark = markMass / markHeight ** 2; //body mass calculation for Mark data set 2
bodyMassJohn = johnMass / johnHeight ** 2; //bosy mass calculation for John data set 2

if (bodyMassMark > bodyMassJohn) {
    console.log(`Mark's BMI (${bodyMassMark}) is higher than John's (${bodyMassJohn})!`);
} else {
    console.log(`John's BMI (${bodyMassJohn}) is higher than Mark's (${bodyMassMark}) !`);
}

// End coding challenge #2



// Coding challenge #3

let Dolphins;
let Koalas;

const dolphinsScore1 = 97;
const dolphinsScore2 = 112;
const dolphinsScore3 = 101;

const koalasScore1 = 109;
const koalasScore2 = 95;
const koalasScore3 = 106;

let avgScoreDolphins = (dolphinsScore1 + dolphinsScore2 + dolphinsScore3) / 3;
let avgScoreKoalas = (koalasScore1 + koalasScore2 + koalasScore3) / 3;


if (avgScoreDolphins > avgScoreKoalas && avgScoreDolphins >= 100) {
    console.log(`Dolphins win the trophy! They are league champions!`);
} else if (avgScoreDolphins < avgScoreKoalas && avgScoreKoalas >= 100) {
    console.log(`Koalas win the trophy! They are league champions!`);
} else if (avgScoreDolphins == avgScoreKoalas) {
    console.log(`There is a draw! No one wins the trophy. :(`);
} else {
    console.log(`There is no winner or draw. No one scored over 100.`);
}

*/

// Coding Challenge #4

let billAmount = 430;

const tip = billAmount <= 300 && billAmount >= 50 ? billAmount * .15 : billAmount * .20
console.log(`The bill was ${billAmount}, the tip was ${tip}, and the total value is ${billAmount + tip}`);





