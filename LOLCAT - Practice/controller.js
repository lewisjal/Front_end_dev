// Controller for the LOLCAT application
// import { pageClock } from "./model.js";
const clockView = document.getElementById("clock");
const eventReport = documentgit;

// Runs clock on page
const pageClock = async function () {
  const now = new Date();
  const options = {
    hour: "numeric",
    minute: "numeric",
    second: "numeric",
  };
  const locale = navigator.local;
  const today = new Intl.DateTimeFormat(locale, options);
  clockView.textContent = today.format(now);
};
pageClock();

setInterval(() => pageClock(), 1000);
