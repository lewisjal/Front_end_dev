// THis document is for the coding challenges for section 11 of 20: Working with arrays

// My job:
// Create a function 'checkDogs', which accepts 2 arrays of dog's ages ('dogsJulia' and 'dogsKate'), and does the following things:
// 1. Julia found out that the owners of the first and the last two dogs actually have cats, not dogs! So create a shallow copy of Julia's array, and remove the cat ages from that copied array (because it's a bad practice to mutate function parameters)
// 2. CreateanarraywithbothJulia's(corrected)andKate'sdata
// 3. Foreachremainingdog,logtotheconsolewhetherit'sanadult("Dognumber1
// is an adult, and is 5 years old") or a puppy ("Dog number 2 is still a puppy   ")
// 4. Runthefunctionforbothtestdatasets

// create function 'checkDogs'

const checkDogs = function (dogsJulia, dogsKate) {
  const Julia_copy = dogsJulia.slice(1, -2);
  const allDogAges = Julia_copy.concat(dogsKate);

  const dogAges = allDogAges.forEach(function (dog, i) {
    i >= 3
      ? console.log(`Dog number ${i + 1} is an adult, and is ${dog} years old!`)
      : console.log(`Dog number ${i + 1} is still a puppy   `);
  });
};

checkDogs([3, 5, 2, 12, 7], [4, 1, 15, 8, 3]);

//////////////////////////////////////////////////////////////////////////

// Coding challenge #2

const dogAges = [5, 2, 4, 1, 15, 8, 3];

// const calcAverageHumanAge = function (ages) {
//   console.log(ages);
//   const humanAge1 = ages.map(years => {
//     years <= 2 ? (humanAge = 2 * years) : (humanAge = 16 + years * 4);
//     return humanAge;
//   });

//   const filteredHuman = humanAge1.filter(years => years > 18);

//   console.log(filteredHuman);

//   const averageHumanAge = filteredHuman.reduce((ages, curr, i, arr) => {
//     return ages + curr;
//   }, 0);

//   return averageHumanAge / filteredHuman.length;
// };

// console.log(calcAverageHumanAge(dogAges));

// Coding challenge #3
const calcAverageHumanAge = ages =>
  ages
    .map(years => (years <= 2 ? 2 * years : 16 + years * 4))
    .filter(years => years > 18)
    .reduce((acc, ages, i, arr) => {
      return acc + ages / arr.length;
    }, 0);

console.log(calcAverageHumanAge(dogAges));

/*
// Coding Challenge #4

// 1. Loopoverthe'dogs'arraycontainingdogobjects,andforeachdog,calculate the recommended food portion and add it to the object as a new property. Do not create a new array, simply loop over the array. Forumla: recommendedFood = weight ** 0.75 * 28. (The result is in grams of food, and the weight needs to be in kg)
// 2. FindSarah'sdogandlogtotheconsolewhetherit'seatingtoomuchortoo little. Hint: Some dogs have multiple owners, so you first need to find Sarah in the owners array, and so this one is a bit tricky (on purpose) 🤓
// 3. Createanarraycontainingallownersofdogswhoeattoomuch ('ownersEatTooMuch') and an array with all owners of dogs who eat too little ('ownersEatTooLittle').
// 4. Logastringtotheconsoleforeacharraycreatedin3.,likethis:"Matildaand Alice and Bob's dogs eat too much!" and "Sarah and John and Michael's dogs eat too little!"
// 5. Logtotheconsolewhetherthereisanydogeatingexactlytheamountoffood that is recommended (just true or false)
// 6. Logtotheconsolewhetherthereisanydogeatinganokayamountoffood (just true or false)
// 7. Createanarraycontainingthedogsthatareeatinganokayamountoffood(try to reuse the condition used in 6.)
// 8. Createashallowcopyofthe'dogs'arrayandsortitbyrecommendedfood portion in an ascending order (keep in mind that the portions are inside the array's objects 😉)

const dogs = [
  { weight: 22, curFood: 250, owners: ['Alice', 'Bob'] },
  { weight: 8, curFood: 200, owners: ['Matilda'] },
  { weight: 13, curFood: 275, owners: ['Sarah', 'John'] },
  { weight: 32, curFood: 340, owners: ['Michael'] },
];

// console.log(dogs.map(dog => dog.weight));

// My solution

// Task #1 find the recommened food portion  for each dog
const recommendedFood = dogs.map(dog => dog.weight ** 0.75 * 28);
console.log(recommendedFood);

const sarahDog = dogs.filter(object => object.owners.includes('Sarah'));
const eatingFood =
  sarahDog.curFood > recommendedFood
    ? 'The dog is eating too much'
    : 'The dog is not eating enough';
console.log(eatingFood);

// const recommendedFood = calcFoodPortion(dogs);

// ownersEatTooMuch.push(
// for (const food of recommendedFood) {
//   console.log(dogs.map(food => food.curFood)); //> food);
// }
const dogFood = recommendedFood;
console.log(dogFood);

const dogTooMuch = dogs
  .filter(object => object.owners)
  .filter((food, i) => food.curFood > dogFood[i]);

const ownersEatTooMuch = dogTooMuch.flatMap(owner => owner.owners);
console.log(ownersEatTooMuch);

const dogTooLess = dogs
  .filter(object => object.owners)
  .filter((food, i) => food.curFood < dogFood[i]);

const ownersEatTooLittle = dogTooLess.flatMap(owner => owner.owners);
console.log(ownersEatTooLittle);

console.log(
  `${ownersEatTooLittle.map(object => `${object} and`)} eats too little!`
);
console.log(
  `${ownersEatTooMuch.map(object => `${object} and`)} eats too Much!`
);

const dogEatEnough = dogs.map((food, i) => food.curFood === dogFood[i]);
console.log(dogEatEnough);

const dogEatOkay = dogs.map(
  (food, i) =>
    food.curFood >= dogFood[i] * 0.9 || food.curFood <= dogFood[i] * 1.1
);
console.log(dogEatOkay);

const arrayOfDogs = dogs
  .filter(dog => dog.curFood)
  .filter(
    (food, i) =>
      food.curFood >= dogFood[i] * 0.9 || food.curFood <= dogFood[i] * 1.1
  );

console.log(arrayOfDogs);

const recommendedSort = dogs
  .filter(object => object.curFood)
  .filter()
  .sort((a, b) => a - b);

// console.log(ownersEatTooMuch);
// console.log(ownersEatTooMuch);
// console.log(ownersEatTooMuch);

// console.log(ownersEatTooMuch);
*/

const dogs = [
  { weight: 22, curFood: 250, owners: ['Alice', 'Bob'] },
  { weight: 8, curFood: 200, owners: ['Matilda'] },
  { weight: 13, curFood: 275, owners: ['Sarah', 'John'] },
  { weight: 32, curFood: 340, owners: ['Michael'] },
];

// 1.
dogs.forEach(dog => (dog.recFood = Math.trunc(dog.weight ** 0.75 * 28)));
console.log(dogs);

// 2.
const dogSarah = dogs.find(dog => dog.owners.includes('Sarah'));
console.log(dogSarah);
console.log(
  `Sarah's dog is eating too ${
    dogSarah.curFood > dogSarah.recFood ? 'much' : 'little'
  }`
);

// 3.
const ownersEatTooMuch = dogs
  .filter(dog => dog.curFood > dog.recFood)
  .flatMap(dog => dog.owners);
console.log(ownersEatTooMuch);

const ownersEatTooLittle = dogs
  .filter(dog => dog.curFood < dog.recFood)
  .flatMap(dog => dog.owners);
console.log(ownersEatTooLittle);

// 4.
console.log(`${ownersEatTooMuch.join(' and ')} dogs eat too much!`);
console.log(`${ownersEatTooLittle.join(' and ')} dogs eat too little!`);

// 5.
console.log(dogs.some(dog => dog.curFood === dog.recFood));

// 6.
const checkEatOkay = dog =>
  dog.curFood > dog.recFood * 0.9 && dog.curFood < dog.recFood * 1.1;

console.log(dogs.some(checkEatOkay));

//7.
console.log(dogs.filter(checkEatOkay));

// 8.
const dogsSorted = dogs.slice().sort((a, b) => a.recFood - b.recFood);
console.log(dogsSorted);
