/* // Lecture: Values and Variable homework

const country = "USA";
const continent = "America";
let population = 380;

console.log(country);
console.log(continent);
console.log(population);

// Lecture: Data types homework

let isIsland = false;

let language;

console.log(typeof isIsland);
console.log(typeof population);
console.log(typeof country);
console.log(typeof language);

// Lecture: let, const, var homework

language = "English";

console.log(country);

//country = "China";
//console.log(country);

//Lecture: baic operators

// half the population of the country
numberHalfPopulation = population / 2;
numberHalfPopulation++; // add one to the half number of population
console.log(numberHalfPopulation);

// Introduce the population of finland
finlandPop = 6;
console.log(numberHalfPopulation > finlandPop); // comparison of population between my country and finland

// Introduce the average population size of a country
avgPop = 33;
console.log(numberHalfPopulation > avgPop); // comparison of population between my country and avg popuation size

let description = 'Portugal is in Europe, and its 11 million people speak portugese';

// Lecture: String and template literals

description = `Portugal is in Europe, and its 11 million people speak Portugese`;

console.log(description);

//Lecture: Taking decisions if/else statements

if (population > avgPop) {
    console.log(`${country}'s population is above average`);
} else {
    console.log(`${country}'s population is ${avgPop - population} million below average`);
}

// Lecture: Type conversion and coercion

console.log('9' - '5');
console.log('19' - '13' + '17');
console.log('19' - '13' + 17);
console.log('123' < 57);
console.log(5 + 6 + '4' + 9 - 4 - 2);

// Lecture: == & ===

const numNeighbors = Number(prompt('How many neighbor countries does your country have?'));

console.log(typeof numNeighbors)
if (numNeighbors === 1) console.log(`Only 1 border!`);
else if (numNeighbors > 1) console.log(`More than 1 border!`);
else console.log(`No borders`);



// Lecture: Logical Operators

if (language === `English` && population < 50 && isIsland === false) {
    console.log(`You should live in the United States! :D`);
} else {
    console.log('The United States does not meet your criteria! :(')
}



 // Lecture: The switch statement

const language = prompt(`What language do you speak?`)

switch (language) {
    case 'Chinese':
    case 'Mandarin':
        console.log(`MOST number of native spekaers!`);
        break;
    case 'Spanish':
        console.log(`2nd place in number of native speakers`);
        break;
    case 'English':
        console.log(`3rd place`);
        break
    case 'Hindi':
        console.log(`Number 4`);
        break
    case 'Arabic':
        console.log(`5th most spoken language`);
        break
    default:
        console.log(`Great language too :D`)
}




// Lecture: The conditional (Ternary) operator

const countryPop = population >= 33 ? `${country}'s population is above average` : `${country}'s population is below average`;

console.log(countryPop);

*/

