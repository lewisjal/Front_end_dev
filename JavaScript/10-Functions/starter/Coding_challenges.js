// Create a poll

/*
// My solution
const poll = {
  question: 'What is your favourite programming language?',
  options: ['0: JavaScript', '1: Python', '2: Rust', '3: C++'],
  // This generates [0, 0, 0, 0]. More in the next section!
  answers: new Array(4).fill(0),
  registerNewAnswer() {
    const answer = prompt(`${this.question}\n${this.options.join('\n')}
    (Write option number)`);
    if (answer == 0) {
      this.answers[0]++;
    } else if (answer == 1) {
      this.answers[1]++;
    } else if (answer == 2) {
      this.answers[2]++;
    } else if (answer == 3) {
      this.answers[3]++;
    } else {
      console.log('You did not click any of the choices!');
    }
    this.displayResults();
    this.displayResults('string');
  },

  displayResults: function (type = 'array') {
    if (type === 'array') {
      console.log(this.answers);
    } else if (typeof type === 'string') {
      console.log(`Poll results are ${[...this.answers]}`);
    }
  },
};

document
  .querySelector('.poll')
  .addEventListener('click', poll.registerNewAnswer.bind(poll));

// poll.displayResults.call({ answers: [5, 2, 3] }, 'string');

// Data1:[5,2,3]
// Data2:[1,5,3,9,6,1]
// Create a method called 'registerNewAnswer' on the poll object
//  Does 2 things display a prompt
// update answers array with number of responses

//  const newPoll = poll.registerNewAnswer;

// console.log(newPoll.call(poll));

*/
//////////////////////////////////////////////////////////////////////////

// Coding Challenge #2
(function () {
  const header = document.querySelector('h1');
  header.style.color = 'red';
  document.querySelector('body').addEventListener('click', function () {
    header.style.color = 'blue';
  });
})();
