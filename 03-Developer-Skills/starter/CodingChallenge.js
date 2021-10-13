// Coding Challenge #1 for Developer Skills and Editor Setup

// 1) Understanding the problem
// - How to make temperatures display correctly
// - How to not hard code the issue in order to get a result

// 2)Break into sub-problems
// - First make sure the degrees read right for any number input
// - Must be a string
// - Days should not be hard coded

temps1 = [17, 21, 23];
temps2 = [12, 5, -5, 0, 4];

temps = temps1.concat(temps2);

function printForecast(arr) {
  let temperature = 0;
  let str = '';
  while (temperature < arr.length) {
    str += `...${arr[temperature]}ºC in ${temperature + 1} days`;
    temperature++;
  }
  console.log(str);
}

printForecast(temps);
