// Section 16 coding challenges

const btn = document.querySelector('.btn-country');
const countriesContainer = document.querySelector('.countries');

// Challenge number 1
// In this challenge you will build a function 'whereAmI' which renders a country only based on GPS coordinates. For that, you will use a second API to geocode coordinates. So in this challenge, you’ll use an API on your own for the first time 😁
// Your tasks:
// PART 1
// 1. Create a function 'whereAmI' which takes an inputs alatitudevalue('lat') and a longitude value ('lng') (these are GPS coordinates, examples are in test data below).
// 2. Do “reverse geocoding” of the provided coordinates. Reverse geocoding means to convert coordinates to a meaningful location, like a city and country name. Use this API to do reverse geocoding: https://geocode.xyz/api. The AJAX call will be done to a URL with this format: https://geocode.xyz/52.508,13.381?geoit=json. Use the fetch API and promises to get the data. Do not use the 'getJSON' function we created, that is cheating 😉
// 3. Once you have the data,take a look at it in the console to see all the attributes that you received about the provided location. Then, using this data, log a message like this to the console: “You are in Berlin, Germany”
// 4. Chain a .catch method to the end of the promise chain and log errors to the console
// 5. This API allows you to make only 3 requests per second.If you reloadf ast,you will get this error with code 403. This is an error with the request. Remember, fetch() does not reject the promise in this case. So create an error to reject the promise yourself, with a meaningful error message

const whereAmI = function (lat, lng) {
  const reverseAPI = fetch(`https://geocode.xyz/${lat},${lng}?geoit=json`)
    .then(response => {
      if (response.status === 403) {
        throw new Error(`Too many requests (${response.status})`);
      }
      return response.json();
    })

    .then(data => {
      console.log(`You are in ${data.city}, ${data.country}`);
      return fetch(`https://restcountries.com/v3/name/${data.country}`);
    })
    .then(response => {
      if (!response.ok)
        throw new Error(`Country not found(${response.status})`);
      return response.json();
    })
    .then(data => renderCountry(data[0]))

    .catch(err => {
      console.log(`${err.message}`);
    });
};

// whereAmI(-33.933, 18.474);

const renderCountry = function (data, className = '') {
  const flag = [...data.flags][0];
  console.log(flag);
  const html = `
    <article class="country ${className}">
      <img class="country__img" src="${flag}" />
      <div class="country__data">
          <h3 class="country__name">${data.name.common}</h3>
          <h4 class="country__region">${data.region}</h4>
          <p class="country__row"><span>👫</span>${(
            +data.population / 1000000
          ).toFixed(1)}</p>
          <p class="country__row"><span>🗣️</span>${Object.keys(
            data.languages
          )}</p>
          <p class="country__row"><span>💰</span>${
            Object.keys(data.currencies)[0]
          }</p>
      </div>
    </article>
    `;
  countriesContainer.insertAdjacentHTML('beforeend', html);
  countriesContainer.style.opacity = 1;
};

const renderError = function (message) {
  countriesContainer.insertAdjacentText('beforeend', message);
  countriesContainer.style.opacity = 1;
};

// const getCountryData = function (country) {
//   // Country 1
//   fetch(`https://restcountries.com/v3/name/${country}`)
//     .then(response => {
//       console.log(response);

//       if (!response.ok)
//         throw new Error(`Country not found (${response.status})`);

//       return response.json();
//     })
//     .then(data => {
//       renderCountry(data[0]);
//       const neighbor = data[0].borders[0];
//       console.log(neighbor);

//       if (!neighbor) throw new Error('No neighbor found!');

//       // Country 2
//       return fetch(`https://restcountries.com/v3/alpha/${neighbor}`);
//     })
//     .then(response => response.json())
//     .then(data => renderCountry(data[0], 'neighbour'))
//     .catch(err => {
//       //   console.error(`${err} 💥💥💥💥`);
//       renderError(`Something went wrong 💥💥💥💥 ${err.message}. Try again.`);
//     })
//     .finally(() => {
//       countriesContainer.style.opacity = 1;
//     });
// };

//////////////////////////////////////////////////////////////////////////////////////////////////////

// Coding Challenge #2
// For this challenge you will actually have to watch the video! Then, build the image loading functionality that I just showed you on the screen.
// Your tasks:
// Tasks are not super-descriptive this time, so that you can figure out some stuff by yourself. Pretend you're working on your own 😉
// PART 1
// 1. Create a function 'createImage' which receives 'imgPath' as an input. This function returns a promise which creates a new image (use document.createElement('img')) and sets the .src attribute to the provided image path
// 2. When the image is done loading, append it to the DOM element with the 'images' class, and resolve the promise. The fulfilled value should be the image element itself. In case there is an error loading the image (listen for the'error' event), reject the promise
// 3. If this part is too tricky for you, just watch the first part of the solution
// PART 2
// 4. Consume the promise using .thenandalsoaddan error handler
// 5. After the image has loaded, pause execution for 2 seconds using the 'wait'
// function we created earlier
// 6. After the 2 seconds have passed,hide the current image (setdisplayCSS
// property to 'none'), and load a second image (Hint: Use the image element returned by the 'createImage' promise to hide the current image. You will need a global variable for that 😉)
// 7. After the second image has loaded,pause execution for 2 seconds again
// 8. After the2 seconds have passed,hide the current image

const imgLoad = document.querySelector('.images');

const createImage = function (imgPath) {
  return new Promise(function (resolve, reject) {
    const image = document.createElement('img');
    image.src = imgPath;

    image.addEventListener('load', function () {
      imgLoad.append(image);
      resolve(image);
    });

    image.addEventListener('error', function () {
      reject(new Error('Could not load image'));
    });
  });
};

let currentImg;

createImage('img/img-1.jpg')
  .then(image => {
    currentImg = image;
    console.log('IMAGE 1 LOADED');
    return wait(2);
  })
  .then(() => {
    currentImg.style.display = 'none';
    wait(2);
    return createImage('img/img-2.jpg');
  })
  .then(image => {
    currentImg = image;
    console.log('IMAGE 2 LOADED');
    return wait(2);
  })
  .then(() => {
    currentImg.style.display = 'none';
  })
  .catch(err => console.error(err));

const wait = function (seconds) {
  return new Promise(function (resolve) {
    setTimeout(resolve, seconds * 1000);
  });
};
