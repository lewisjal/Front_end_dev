'use strict';

/////////////////////////////////////////////////
/////////////////////////////////////////////////
// BANKIST APP

// Data
const account1 = {
  owner: 'Jonas Schmedtmann',
  movements: [200, 450, -400, 3000, -650, -130, 70, 1300],
  interestRate: 1.2, // %
  pin: 1111,
};

const account2 = {
  owner: 'Jessica Davis',
  movements: [5000, 3400, -150, -790, -3210, -1000, 8500, -30],
  interestRate: 1.5,
  pin: 2222,
};

const account3 = {
  owner: 'Steven Thomas Williams',
  movements: [200, -200, 340, -300, -20, 50, 400, -460],
  interestRate: 0.7,
  pin: 3333,
};

const account4 = {
  owner: 'Sarah Smith',
  movements: [430, 1000, 700, 50, 90],
  interestRate: 1,
  pin: 4444,
};

const accounts = [account1, account2, account3, account4];

// Elements
const labelWelcome = document.querySelector('.welcome');
const labelDate = document.querySelector('.date');
const labelBalance = document.querySelector('.balance__value');
const labelSumIn = document.querySelector('.summary__value--in');
const labelSumOut = document.querySelector('.summary__value--out');
const labelSumInterest = document.querySelector('.summary__value--interest');
const labelTimer = document.querySelector('.timer');

const containerApp = document.querySelector('.app');
const containerMovements = document.querySelector('.movements');

const btnLogin = document.querySelector('.login__btn');
const btnTransfer = document.querySelector('.form__btn--transfer');
const btnLoan = document.querySelector('.form__btn--loan');
const btnClose = document.querySelector('.form__btn--close');
const btnSort = document.querySelector('.btn--sort');

const inputLoginUsername = document.querySelector('.login__input--user');
const inputLoginPin = document.querySelector('.login__input--pin');
const inputTransferTo = document.querySelector('.form__input--to');
const inputTransferAmount = document.querySelector('.form__input--amount');
const inputLoanAmount = document.querySelector('.form__input--loan-amount');
const inputCloseUsername = document.querySelector('.form__input--user');
const inputClosePin = document.querySelector('.form__input--pin');

// const removeTransfer = function () {
//   document.querySelector('.operation--transfer').style.opacity = 0;
// };

const displayMovements = function (movements, sort = false) {
  containerMovements.innerHTML = '';
  // .textContent = 0

  const movs = sort ? movements.slice().sort((a, b) => a - b) : movements;

  movs.forEach(function (mvmnt, i) {
    const type = mvmnt > 0 ? 'deposit' : 'withdrawal';

    const html = `<div class="movements__row">
    <div class="movements__type movements__type--${type}">${
      i + 1
    } ${type} </div>
    <div class="movements__value">${mvmnt}€</div>
  </div>`;

    containerMovements.insertAdjacentHTML('afterbegin', html);
  });
};

const calcPrintBalance = function (acc) {
  acc.balance = acc.movements.reduce((accum, cur) => accum + cur, 0);
  labelBalance.textContent = `${acc.balance} €`;
};

const calcDisplaySummary = function (acc) {
  const incomes = acc.movements
    .filter(mvmnt => mvmnt > 0)
    .reduce((acc, mvmnt) => acc + mvmnt);
  labelSumIn.textContent = `${incomes} €`;

  const out = acc.movements
    .filter(mvmnt => mvmnt < 0)
    .reduce((acc, mvmnt) => acc + mvmnt);
  labelSumOut.textContent = `${Math.abs(out)} €`;

  const interest = acc.movements
    .filter(mvmnt => mvmnt > 0)
    .map(deposit => deposit * (acc.interestRate / 100))
    .filter((int, i, arr) => {
      return int > 1;
    })
    .reduce((acc, int) => acc + int);
  labelSumInterest.textContent = `${interest}€`;

  // const interest = movements.
};

// console.log(containerMovements.innerHTML);

// const createUserNames = function (name) {
//   return user
//     .toLowerCase()
//     .split(' ')
//     .map(name => name[0])
//     .join('');
// };

const createUserNames = function (accs) {
  accs.forEach(acc => {
    acc.username = acc.owner
      .toLowerCase()
      .split(' ')
      .map(name => name[0])
      .join('');
  });
};
console.log('Steven Thomas Williams'); // username: stw
createUserNames(accounts);
console.log(accounts);

const updateUI = function (acc) {
  // Display movements
  displayMovements(acc.movements);
  // Display balance
  calcPrintBalance(acc);
  // Display summary
  calcDisplaySummary(acc);
};

// Event handler
let currentAccount;

btnLogin.addEventListener('click', function (event) {
  // Prevent form from submitting
  event.preventDefault();

  currentAccount = accounts.find(
    acc => acc.username === inputLoginUsername.value
  );
  console.log(currentAccount);

  if (currentAccount?.pin === Number(inputLoginPin.value)) {
    // Display UI and welcome message
    labelWelcome.textContent = `Welcome back, ${
      currentAccount.owner.split(' ')[0]
    }.`;
    containerApp.style.opacity = 100;

    // Clear input fields
    inputLoginUsername.value = inputLoginPin.value = '';
    inputLoginPin.blur();

    // Update UI
    updateUI(currentAccount);

    // removeTransfer();
  }
});

btnTransfer.addEventListener('click', function (event) {
  event.preventDefault();
  const amount = Number(inputTransferAmount.value);
  const receiverAcc = accounts.find(
    acc => acc.username === inputTransferTo.value
  );
  inputTransferAmount.value = inputTransferTo.value = '';

  if (
    amount > 0 &&
    receiverAcc &&
    currentAccount.balance >= amount &&
    receiverAcc?.username !== currentAccount.username
  ) {
    // Doing the transfer
    currentAccount.movements.push(-amount);
    receiverAcc.movements.push(amount);

    // Update UI
    updateUI(currentAccount);
  }
});

btnLoan.addEventListener('click', function (event) {
  event.preventDefault();

  const amount = Number(inputLoanAmount.value);

  if (amount > 0 && currentAccount.movements.some(mov => mov >= amount * 0.1)) {
    // Add movement
    currentAccount.movements.push(amount);

    // Update UI
    updateUI(currentAccount);
  }
  inputLoanAmount.value = '';
});

btnClose.addEventListener('click', function (event) {
  event.preventDefault();

  if (
    inputCloseUsername.value === currentAccount.username &&
    Number(inputClosePin.value) === currentAccount.pin
  ) {
    const index = accounts.findIndex(
      acc => acc.username === currentAccount.username
    );
    console.log(index);

    // .indexOf(23)

    // Delete account
    accounts.splice(index, 1);

    // Hide UI
    containerApp.style.opacity = 0;
  }
});

let sorted = false;

btnSort.addEventListener('click', function (event) {
  event.preventDefault;

  displayMovements(currentAccount.movements, !sorted);
  sorted = !sorted;
});

/////////////////////////////////////////////////
/////////////////////////////////////////////////
// LECTURES

const movements = [200, 450, -400, 3000, -650, -130, 70, 1300];

/////////////////////////////////////////////////
/*
let arr = ['a', 'b', 'c', 'd', 'e'];

// SLICE
console.log(arr.slice(2));
console.log(`This is slice(${arr.slice(2, 4)})`);
console.log(arr.slice(-2));
console.log(arr.slice(-1));
console.log(arr.slice(1, -2));
console.log(arr.slice());
console.log([...arr]);

//SPLICE - Does mutate
// console.log(arr.splice(2));
arr.splice(-1);
console.log(arr);
arr.splice(1, 2);
console.log(arr);

// REVERSE - Does Mutate
arr = ['a', 'b', 'c', 'd', 'e'];
const arr2 = ['j', 'i', 'h', 'g', 'f'];
console.log(arr2.reverse());
console.log(arr2);

//Concat
const letters = arr.concat(arr2);
console.log(letters);
console.log([...arr, ...arr2]);

// JOIN
console.log(letters.join(' - '));


*/

/////////////////
/*
// for (const movement of movements) {
for (const [i, movement] of movements.entries()) {
  if (movement > 0) console.log(`Movement ${i + 1}: You deposited ${movement}`);
  else console.log(`Movement ${i + 1}: You withdrew ${Math.abs(movement)}`);
}

console.log('---FOR EACH----');
movements.forEach(function (mvmnt, i, arr) {
  if (mvmnt > 0) console.log(`Movement ${i + 1}: You deposited ${mvmnt}`);
  else console.log(`Movement ${i + 1}: You withdrew ${Math.abs(mvmnt)}`);
});
// 0: function(200)
// 1: function(450)
// 2: function(400)
// ......



// MAP
const currencies = new Map([
  ['USD', 'United States dollar'],
  ['EUR', 'Euro'],
  ['GBP', 'Pound sterling'],
]);

currencies.forEach(function (val, key, map) {
  console.log(`${key}: ${val}`);
});

// SET
const currenciesUnique = new Set(['USD', 'GBP', 'USD', 'EUR', 'EUR']);
console.log(currenciesUnique);
currenciesUnique.forEach(function (val, _, map) {
  console.log(`${val}: ${val}`);
});


const euroToUsd = 1.1;

const movementsUSD = movements.map(function (mvmnt) {
  return mvmnt * euroToUsd;
  // return 23;
});
console.log(movements);
console.log('map(function):', movementsUSD);

const movementsArrow = movements.map(mvmnt => mvmnt * euroToUsd);
console.log('Arrow:', movementsArrow);

const movementsUSDfor = [];
for (const mov of movements) movementsUSDfor.push(mov * euroToUsd);
console.log('Array:', movementsUSDfor);

const movementsDescription = movements.map((mvmnt, i) => {
  return `Movement ${i + 1}: You ${
    mvmnt > 0 ? 'deposited' : 'withdrew'
  } ${Math.abs(mvmnt)}`;

  // if (mvmnt > 0) {
  //   return `Movement ${i + 1}: You deposited ${mvmnt}`;
  // } else return `Movement ${i + 1}: You withdrew ${Math.abs(mvmnt)}`;
});

console.log(movementsDescription);


const deposits = movements.filter(function (mvmnt) {
  return mvmnt > 0;
});
console.log(movements);
console.log(deposits);

const depositsFor = [];
for (const mov of movements) if (mov > 0) depositsFor.push(mov);
console.log(depositsFor);

const withdrawals = movements.filter(mvmnt => mvmnt < 0);
console.log(withdrawals);

console.log(movements);


// accumulator --> SNOWBALL
// const balance = movements.reduce(function (accum, curr, i, arr) {
//   console.log(`Iteration ${i}: ${accum}`);
//   return accum + curr;
// }, 0);
// console.log(balance);

const balance = movements.reduce((accum, curr) => {
  return accum + curr;
}, 0);
console.log(balance);

let balance2 = 0;
for (const mov of movements) balance2 += mov;

console.log(balance2);

// Maximum value
const max = movements.reduce((accum, cur) => {
  if (accum > cur) return accum;
  else return cur;
}, movements[0]);

console.log(max);


const euroToUsd = 1.1;
console.log(movements);

// PIPELINE
const totalDepositsUSD = movements
  .filter(mov => mov > 0)
  .map((mov, i, arr) => {
    // console.log(arr);
    return mov * euroToUsd;
  })
  // .map(mov => mov * euroToUsd)
  .reduce((acc, mov) => acc + mov, 0);

console.log(totalDepositsUSD);

const firstWithdrawal = movements.find(mov => mov < 0);
console.log(movements);
console.log(firstWithdrawal);

console.log(accounts);

const account = accounts.find(acc => acc.owner === 'Jessica Davis');
// console.log(account);

// For - of function to find account in array of objects
const findAccount = function () {
  for (const acc of accounts) {
    if (acc.owner === 'Jessica Davis') console.log(acc);
  }
};

findAccount();


console.log(movements);

// EQUALITY
console.log(movements.includes(-130));

// SOME: CONDITION
console.log(movements.some(mov => mov === -130));

const anyDeposits = movements.some(mov => mov > 1500);
console.log(anyDeposits);

// EVERY
console.log(movements.every(mov => mov > 1500));
console.log(account4.movements.every(mov => mov > 0));

// Seperate call back
const deposit = mov => mov > 0;
console.log(movements.some(deposit));
console.log(movements.every(deposit));
console.log(movements.filter(deposit));

const arr = [[1, 2, 3], [4, 5, 6], 7, 8];
console.log(arr.flat());

const arrDeep = [[[1, 2], 3], [4, [5, 6]], 7, 8];
console.log(arrDeep.flat(2));

// const accountMovements = accounts.map(acc => acc.movements);
// console.log(accountMovements);
// const allMovements = accountMovements.flat();
// console.log(allMovements);
// const overallBalance = allMovements.reduce((acc, curr) => acc + curr, 0);
// console.log(overallBalance);

// flat
const overallBalance = accounts
  .map(acc => acc.movements)
  .flat()
  .reduce((acc, curr) => acc + curr, 0);
console.log(overallBalance);

// Flat map
const overallBalance2 = accounts
  .flatMap(acc => acc.movements)
  .reduce((acc, curr) => acc + curr, 0);
console.log(overallBalance2);


// String
const owners = ['Jonas', 'Zach', 'Adam', 'Martha'];
console.log(owners.sort());
console.log(owners);

// Number
console.log(movements);

// Retunr > 0, B, A (Switch order)
// Return < 0, A, B (Keep order)

// Ascending
// movements.sort((a, b) => {
//   if (a > b) return 1;
//   if (a < b) return -1;
// });

movements.sort((a, b) => a - b);
console.log(movements);

// Descending
// movements.sort((a, b) => {
//   if (a > b) return -1;
//   if (a < b) return 1;
// });
movements.sort((a, b) => b - a);
console.log(movements);


const arr = [1, 2, 3, 4, 5, 6, 7];
console.log(new Array(1, 2, 3, 4, 5, 6, 7));

// Empty arrays + fill method
const x = new Array(7);
console.log(x);
// console.log(x.map(() => 5));
// x.fill(4);
x.fill(1, 3, 5);
x.fill(1);
console.log(x);

arr.fill(23, 2, 6);
console.log(arr);

// Array.from
const y = Array.from({ length: 7 }, () => 1);
console.log(y);

const z = Array.from({ length: 7 }, (_, i) => i + 1);
console.log(z);

// const randomDie = Array.from(
//   { length: 100 },
//   (_, i) => Math.trunc().random() + 1
// );
// console.log(randomDie);

// Shows all elements under movements value class
console.log(document.querySelectorAll('.movements__value'));

// Creates an array from array like iterable
const movementsUI = Array.from(document.querySelectorAll('.movements__value'));
console.log(movementsUI);

// Function that creates an array form elemtns on the document to be able to convert from said document

labelBalance.addEventListener('click', function () {
  const movementsUI = Array.from(
    document.querySelectorAll('.movements__value'),
    el => el.textContent //Number(el.textContent) //.replace('€', ''))
  );
  console.log(movementsUI);

  const movementsUI2 = [...document.querySelectorAll('.movements__value')];
  console.log(movementsUI2);
});
*/
////////////////////////////////////////////////////////////////////////////
// Array methods practice

// Exercise #1: Get total amount of deposits in bank as a whole
const bankDepositSum = accounts
  .flatMap(acc => acc.movements)
  .filter(mov => mov > 0)
  .reduce((acc, curr) => acc + curr, 0);
console.log(bankDepositSum);

// Exercise #2: Calculate number of deposits over 1000
// const numDeposits1000 = accounts
//   .flatMap(acc => acc.movements)
//   .filter(mov => mov >= 1000).length;

const numDeposits1000 = accounts
  .flatMap(acc => acc.movements)
  // .reduce((acc, curr) => (curr >= 1000 ? acc + 1 : acc), 0);
  .reduce((acc, curr) => (curr >= 1000 ? ++acc : acc), 0);

console.log(numDeposits1000);

// Prefixed ++ operator
let a = 10;
console.log(++a);
console.log(a);

// Exercise #3: Create a new object instead of a number or string
const { deposits, withdrawals } = accounts
  .flatMap(acc => acc.movements)
  .reduce(
    (sums, curr) => {
      // curr > 0 ? (sums.deposits += curr) : (sums.withdrawals += curr);
      sums[curr > 0 ? 'deposits' : 'withdrawals'] += curr;
      return sums;
    },
    { deposits: 0, withdrawals: 0 }
  );

console.log(deposits, withdrawals);

// Exercise 4: Convert any strong to a Title case
// this is a nice title --> This Is a Nice Title

const convergeTitleCase = function (title) {
  const capitalize = str => str[0].toUpperCase() + str.slice(1);

  const exceptions = ['a', 'an', 'and', 'the', 'but', 'or', 'on', 'in', 'with'];

  const titleCase = title
    .toLowerCase()
    .split(' ')
    .map(word => (exceptions.includes(word) ? word : capitalize(word)))
    .join(' ');
  return capitalize(titleCase);
};

console.log(convergeTitleCase('this is a nice title'));
console.log(convergeTitleCase('this is a LONG title but not too long'));
console.log(convergeTitleCase('and here is another title with an EXAMPLE'));
////////////////////////////////////////////////////////////////////////////
