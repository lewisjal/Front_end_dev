//  Javascript fundamentals part 2 - Coding Challenges
/*

// Coding Challenge #1

const calcAverage = (score1, score2, score3) => (score1 + score2 + score3) / 3;

const dolphinsScore = calcAverage(85, 54, 41);
const koalasScore = calcAverage(23, 34, 27);

function checkWinner(avgDolphins, avgKoalas) {

    console.log(dolphinsScore);
    console.log(koalasScore);

    if (dolphinsScore >= (2 * koalasScore)) {
        return `Dolphins win (${dolphinsScore} vs ${koalasScore})`
    } else if (koalasScore >= (2 * dolphinsScore)) {
        return `Koalas win (${koalasScore} vs. ${dolphinsScore})`
    }
}

// console.log(checkWinner(dolphinsScore, koalasScore));

// Coding Challenge #2
function calcTip(bill) {
    if (bill <= 300 || bill >= 50) {
        const tip = bill * .15
        return tip
    } else {
        const tip = bill * .20
        return tip
    }
}

console.log(calcTip(100));
const bills = [125, 555, 44];
const tips = [calcTip(bills[0]), calcTip(bills[1]), calcTip(bills[2])];
const total = [bills[0] + tips[0], bills[1] + tips[1], bills[2] + tips[2]];

console.log(bills, tips, total);

// Coding Challenge #3
const mark = {
    firstName: 'Mark',
    lastName: 'Miller',
    mass: 78,
    height: 1.69,

    calcBMI: function () {
        this.BMI = this.mass / (this.height ** 2)
        return this.BMI
    }
}

const john = {
    firstName: 'John',
    lastName: 'Smith',
    mass: 92,
    height: 1.95,

    calcBMI: function () {
        this.BMI = this.mass / (this.height ** 2)
        return this.BMI
    }
}


if (mark.calcBMI() > john.calcBMI) {
    console.log(`${mark.firstName}'s BMI (${mark.calcBMI()} is higher than ${john.firstName}'s (${john.calcBMI()}) BMI)`);
} else {
    console.log(`${john.firstName}'s BMI (${john.calcBMI()} is higher than ${mark.firstName}'s (${mark.calcBMI()}) BMI)`)
}

*/

// Coding Challenge #4
let bill = [22, 295, 176, 440, 37, 105, 10, 1100, 86, 52];
let tip = [];
let newTotal = [];

function calcTip(bill) {
    if (bill <= 300 && bill >= 50) {
        const tip = bill * .15
        return tip
    } else {
        const tip = bill * .20
        return tip
    }
}

for (i = 0; i < bill.length; i++) {
    tip1 = calcTip(bill[i]);
    tip.push(tip1);
    newTotal1 = bill[i] + tip[i];
    newTotal.push(newTotal1);

}

console.log(bill, tip, newTotal);

function calcAverage(arr) {
    let sum = 0;
    for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
    }

    average = sum / arr.length
    return `The average total is ${average}`
}

console.log(calcAverage(newTotal));