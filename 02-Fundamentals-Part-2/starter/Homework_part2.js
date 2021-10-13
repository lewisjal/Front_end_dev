// Lecture: Functions

function describeCountry(country, population, capitalCity) {
    const countryInfo = `${country} has ${population} million people and its capital city is ${capitalCity}`
    return countryInfo
}

const US = describeCountry(`United States`, 385, `Washington, D.C.`);
const Japan = describeCountry(`Japan`, 127, `Tokyo`);
const Nigeria = describeCountry(`Nigeria`, 201, `Abuja`);

console.log(US, Japan, Nigeria);

// Lecture: Function Declarations vs Expressions

function percentageOfWorld1(population) {
    const worldPop = 7900;
    return (population / worldPop) * 100;

}

usaPercentage = percentageOfWorld1(380);
japanPercentage = percentageOfWorld1(126);
indiaPercentage = percentageOfWorld1(1366);

console.log(usaPercentage, japanPercentage, indiaPercentage);

const percentageOfWorld2 = function (population) {
    const worldPop = 7900
    return (population / worldPop) * 100
}

const UkPercentage = percentageOfWorld2(66.65);
const irelandPercentage = percentageOfWorld2(5);
const brazilPercetnage = percentageOfWorld2(211);

console.log(UkPercentage, irelandPercentage, brazilPercetnage);

// Lecture: Arroow function
const percentageOfWorld3 = population => (population / 7900) * 100;
const mexicoPercentage = percentageOfWorld3(128);
console.log(mexicoPercentage);

// Lecture: Function calling other functions

function describePopulation(country, population) {
    percentage = usaPercentage
    return `${country} has ${population} million people, which is about ${percentage}% of the world`
}

console.log(describePopulation('USA', 328));

// Lecture: Introduction to Arrays

const popUSA = 328;
const popJapan = 128;
const popUK = 121;
const popMexico = 280;

const populations = [popUSA, popJapan, popUK, popMexico];

console.log(populations.length === 4);

const percetnages = [percentageOfWorld1(populations[0]), percentageOfWorld1(populations[1]), percentageOfWorld1(populations[2]), percentageOfWorld1(populations[3])];

console.log(percetnages);

// Lecture: Basic Array operations
const neighbors = ['Cameroon', 'Chad', 'Niger', 'Benin'];
console.log(neighbors);
neighbors.push('Utopia');
console.log(neighbors);
neighbors.pop('Utopia');
console.log(neighbors);

if (!neighbors.includes('Germany')) {
    console.log(`Probably not a central European country :D`);
}

neighbors[neighbors.indexOf('Chad')] = 'Alaska';

console.log(neighbors);

// Lecture: Intro into objects

const myCountry = {
    country: 'USA',
    captial: 'Washington, D.C.',
    language: 'Unofficial - but English',
    population: 328,
    neighbors: ['Canada', 'Mexico']
}

// Lecture: Dot vs Bracket Notation

console.log(`${myCountry.country} has ${myCountry.population} million ${myCountry.language} speaking people, ${myCountry.neighbors.length} neighboring countries and a capital called ${myCountry.captial} `);

console.log(myCountry.population += 2);
console.log(myCountry['population'] -= 2);

// Lecture: Object Methods
myCountry.describe = function () {
    return `${this.country} has ${this.population} million ${this.language} speaking people, ${this.neighbors.length} neighboring countries and a capital called ${this.captial}`
}

myCountry.isIsland = this.neighbors > 0 ? true : false;

console.log(myCountry)
console.log(myCountry.describe());
console.log(myCountry.isIsland);

// Lecture: Iteration: The for loop

for (vote = 1; vote <= 10; vote++) {
    console.log(`Voter number ${vote} is currently voting 🗳`);
}

// Lecture: Looping arrays, breaking and continuing

console.log(populations)
const percentages2 = []

for (i = 0; i < populations.length; i++) {
    percentages2.push(percentageOfWorld1(populations[i]));
}

console.log(percentages2);

// Lecture: Looping Backwards and Loops in Loops

const listOfNeighbors = [['Canada', 'Mexico'], ['Spain'], ['Norway', 'Sweden', 'Russia']];


for (neighbor = 0; neighbor < listOfNeighbors.length; neighbor++) {
    console.log(listOfNeighbors[neighbor]);
    for (country = 0; country < listOfNeighbors[neighbor].length; country++) {
        console.log(`Neighbor: ${listOfNeighbors[neighbor][country]}`);
    }
}

// Lecture: The While Loop
let r = 0;
let newPercent = [];
while (r < populations.length) {
    percentage = percentageOfWorld3(populations[r]);
    newPercent.push(percentage);
    r++;
}

console.log(newPercent);