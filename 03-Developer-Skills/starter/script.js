// Remember, we're gonna use strict mode in all scripts now!
'use strict';

// PROBLEM:
// We work for a company building a smart home thermometer. Our most recent task is this: "Given an array of temperatures of one day, calculate the temperature amplitude. Keep in mimd that sometimes there might be a sensor error."

const temperatures = [3, -2, -6, -1, 'error', 9, 13, 17, 15, 14, 9, 5];

// 1) Understanding the problem
//  - What is temp amplitude? Answer: difference between highest and lowest temperature
// - How to compute the max and min temperatures?
// What is a sensor error? And what to do?

// 2) Breaking up into sub-problems
// - How to ignore errors?
// - Find max value in temp array
// - FInd min value in temp array
// - Subrtract min from max (amplitude) and return it

const calcTempAmplitudeNew = function (t1, t2) {
  const temps = t1.concat(t2);
  console.log(temps);

  let max = temps[0];
  let min = temps[0];

  for (let i = 0; i < temperatures.length; i++) {
    const curTemp = temps[i];
    if (typeof curTemp !== 'number') continue;

    if (curTemp > max) max = curTemp;
    if (curTemp < min) min = curTemp;
  }
  console.log(max, min);
  return max - min;
};
const amplitudeNew = calcTempAmplitudeNew([3, 5, 1], [9, 0, 5]);
console.log(`This is the amplitude: ${amplitudeNew}`);

// PROBLEM 2:
// Function should now receive 2 arrays of temps

// 1) Understanding the problem
// - WIth 2 arrays, should we implement functionality twice? NO! Just merge two arrays

// 2) Breaking up into sub-problems
// - Merge 2 arrays?

const measureKelvin = function () {
  const measurement = {
    type: 'temp',
    unit: 'cels',

    // C) Fix bug
    // value: Number(prompt('Degress Celcius')),
    value: 10,
  };

  console.table(measurement);

  // console.log(measurement.value);
  // console.warn(measurement.value);
  // console.error(measurement.value);
  const kelvin = measurement.value + 273;
  return kelvin;
};
console.log(measureKelvin());

// USING A DEBUGGER

const calcTempAmplitudeBUG = function (t1, t2) {
  const temps = t1.concat(t2);
  console.log(temps);

  let max = temps[0];
  let min = temps[0];

  for (let i = 0; i < temperatures.length; i++) {
    const curTemp = temps[i];
    if (typeof curTemp !== 'number') continue;

    if (curTemp > max) max = curTemp;
    if (curTemp < min) min = curTemp;
  }
  console.log(max, min);
  return max - min;
};
// IDENTIFY the bug
const amplitudeBUG = calcTempAmplitudeBUG([3, 5, 1], [9, 4, 5]);
console.log(`This is the amplitude: ${amplitudeBUG}`);
