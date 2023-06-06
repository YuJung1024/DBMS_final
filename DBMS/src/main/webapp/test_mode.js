let correct = 0;
let total = 0;
const scoreSection = document.querySelector(".score");
const correctSpan = scoreSection.querySelector(".correct");
const totalSpan = scoreSection.querySelector(".total");
const playAgainBtn = scoreSection.querySelector("#play-again-btn");
const draggableElements = document.querySelectorAll(".draggable");
const droppableElements = document.querySelectorAll(".droppable");

// initiateGame();

// function initiateGame() {
draggableElements.forEach(elem => {
  elem.addEventListener("dragstart", dragStart); // Fires as soon as the user starts dragging an item - This is where we can define the drag data
  // elem.addEventListener("drag", drag); // Fires when a dragged item (element or text selection) is dragged
  // elem.addEventListener("dragend", dragEnd); // Fires when a drag operation ends (such as releasing a mouse button or hitting the Esc key) - After the dragend event, the drag and drop operation is complete
});

droppableElements.forEach(elem => {
  elem.addEventListener("dragenter", dragEnter); // Fires when a dragged item enters a valid drop target
  elem.addEventListener("dragover", dragOver); // Fires when a dragged item is being dragged over a valid drop target, repeatedly while the draggable item is within the drop zone
  elem.addEventListener("dragleave", dragLeave); // Fires when a dragged item leaves a valid drop target
  elem.addEventListener("drop", drop); // Fires when an item is dropped on a valid drop target
});

// Drag and Drop Functions

//Events fired on the drag target

function dragStart(event) {
  event.dataTransfer.setData("text/plain", event.target.id); // or "text/plain" but just "text" would also be fine since we are not setting any other type/format for data value
}

//Events fired on the drop target

function dragEnter(event) {
  if (!event.target.classList.contains("dropped")) {
    event.target.classList.add("droppable-hover");
  }
}

function dragOver(event) {
  if (!event.target.classList.contains("dropped")) {
    event.preventDefault(); // Prevent default to allow drop
  }
}

function dragLeave(event) {
  if (!event.target.classList.contains("dropped")) {
    event.target.classList.remove("droppable-hover");
  }
}

function drop(event) {
  event.preventDefault(); // This is in order to prevent the browser default handling of the data
  event.target.classList.remove("droppable-hover");
  const draggableElementData = event.dataTransfer.getData("text"); // Get the dragged data. This method will return any data that was set to the same type in the setData() method
  const droppableElementData = event.target.getAttribute("data-draggable-id");
  const isCorrectMatching = draggableElementData === droppableElementData;
  total++;
  if (isCorrectMatching) {
    correct++;
    const draggableElement = document.getElementById(draggableElementData);
    event.target.classList.add("dropped");
    // event.target.style.backgroundColor = draggableElement.style.color; // This approach works only for inline styles. A more general approach would be the following: 
    // event.target.style.backgroundColor = window.getComputedStyle(draggableElement).color;
    event.target.style.backgroundImage = window.getComputedStyle(draggableElement).backgroundImage;
    draggableElement.classList.add("dragged");
    draggableElement.setAttribute("draggable", "false");
    // event.target.insert("afterbegin", `<img class="${draggableElementData}"></img>`);
    // event.target.insertImage("afterbegin", `<img class="${draggableElementData}"></img>`);  
    // ev.target.appendChild(document.getElementById(data));
  }
    scoreSection.style.opacity = 0;
    setTimeout(() => {  
      correctSpan.textContent = correct;
      totalSpan.textContent = total;
      scoreSection.style.opacity = 1;
    }, 200);
    // if (correct === 5) {// Game Over!!
    //   playAgainBtn.style.display = "block";
    //   setTimeout(() => {
    //     // playAgainBtn.classList.add("play-again-btn-entrance");
    //   }, 200);
    // }
  }
// }
//   playAgainBtn.addEventListener("click", playAgainBtnClick);
// function playAgainBtnClick() {
//   playAgainBtn.classList.remove("play-again-btn-entrance");
//   correct = 0;
//   total = 0;
//   draggableElements.style.opacity = 0;
//   matchingPairs.style.opacity = 0;
//   setTimeout(() => {
//     scoreSection.style.opacity = 0;
//   }, 100);
//   setTimeout(() => {
//     playAgainBtn.style.display = "none";
//     while (draggableElements.firstChild) {if (window.CP.shouldStopExecution(2)) break;draggableElements.removeChild(draggableElements.firstChild);}window.CP.exitedLoop(2);
//     while (matchingPairs.firstChild) {if (window.CP.shouldStopExecution(3)) break;matchingPairs.removeChild(matchingPairs.firstChild);}window.CP.exitedLoop(3);
//     initiateGame();
//     correctSpan.textContent = correct;
//     totalSpan.textContent = total;
//     draggableItems.style.opacity = 1;
//     matchingPairs.style.opacity = 1;
//     scoreSection.style.opacity = 1;
//   }, 500);
// }
