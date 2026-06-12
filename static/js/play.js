let characters = [];
let currentCharacter = null;
let score = 0;

// Key for localStorage to track failed characters 
const STORAGE_KEY = 'hiragana_failed_characters';

// Elements
const characterDisplay = document.getElementById('character-display');
const userInput = document.getElementById('user-input');
const gameForm = document.getElementById('game-form');
const feedbackMessage = document.getElementById('feedback-message');
const scoreCounter = document.getElementById('score-counter');

// Functions to manage failed characters in localStorage
function getFailedIds() {
    const stored = localStorage.getItem(STORAGE_KEY);
    return stored ? JSON.parse(stored) : [];
}

function addFailedId(id) {
    let failedIds = getFailedIds();
    if (!failedIds.includes(id)) {
        failedIds.push(id);
        localStorage.setItem(STORAGE_KEY, JSON.stringify(failedIds));
    }
}

function removeFailedId(id) {
    let failedIds = getFailedIds();
    failedIds = failedIds.filter(failedId => failedId !== id);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(failedIds));
}

// Load characters from the server based on URL parameters
async function loadCharacters() {
    try {
        const urlParams = new URLSearchParams(window.location.search);
        const group = urlParams.get('group') || 'all';
        // Character type (hiragana, katakana, etc.)
        const type = urlParams.get('type') || 'hiragana';

        // Update group/type tag in the UI
        const groupTag = document.getElementById('group-tag');
        groupTag.innerText = `${type.toUpperCase()} - ${group.toUpperCase()}`;

        // Fetch characters from the API
        const response = await fetch(`/api/characters?group=${group}&type=${type}`);
        characters = await response.json();

        if (characters.length > 0) {
            characterDisplay.classList.remove('animate-pulse');
            nextQuestion();
        } else {
            characterDisplay.innerText = "Error: Sin datos";
        }
    } catch (error) {
        console.error("Error fetching characters:", error);
        characterDisplay.innerText = "❌";
    }
}

// Load the next character, with a bias towards previously failed ones
function nextQuestion() {
    userInput.value = '';
    feedbackMessage.className = 'hidden text-sm font-semibold p-3 rounded-xl';

    const failedIds = getFailedIds();

    // Create a pool of previously failed characters
    const poolOfFailures = characters.filter(c => failedIds.includes(c.id));

    let chosenCharacter = null;

    // 30% chance of selecting from the pool of failures, if there are any
    if (poolOfFailures.length > 0 && Math.random() < 0.30) {
        const randomIndex = Math.floor(Math.random() * poolOfFailures.length);
        chosenCharacter = poolOfFailures[randomIndex];
        document.getElementById('group-tag').innerText = "🔄 REPASO DE ERROR";
    } else {
        const randomIndex = Math.floor(Math.random() * characters.length);
        chosenCharacter = characters[randomIndex];

        const urlParams = new URLSearchParams(window.location.search);
        document.getElementById('group-tag').innerText = `Grupo: ${(urlParams.get('group') || 'all').toUpperCase()}`;
    }

    // Avoid repeating the same character consecutively if there are multiple characters available
    if (currentCharacter && chosenCharacter.id === currentCharacter.id && characters.length > 1) {
        return nextQuestion();
    }

    currentCharacter = chosenCharacter;
    characterDisplay.innerText = currentCharacter.kana;
    userInput.focus();
}

// Handle form submission and answer checking
gameForm.addEventListener('submit', function (event) {
    event.preventDefault();

    const answer = userInput.value.trim().toLowerCase();
    const correctAnswer = currentCharacter.romaji.toLowerCase();

    // Disable input and button to prevent multiple submissions while feedback is shown
    userInput.disabled = true;
    const submitBtn = gameForm.querySelector('button[type="submit"]');
    submitBtn.disabled = true;

    if (answer === correctAnswer) {
        score++;
        scoreCounter.innerText = `Aciertos: ${score}`;

        // Remove the character from the list of failed characters if it was previously marked as failed
        removeFailedId(currentCharacter.id);

        feedbackMessage.innerText = "✨ ¡Correcto! ✨";
        feedbackMessage.className = "text-sm font-semibold p-3 rounded-xl bg-emerald-50 text-emerald-700 block";

        setTimeout(() => {
            userInput.disabled = false;
            submitBtn.disabled = false;
            nextQuestion();
        }, 1000); // 

    } else {
        // Add the character to the list of failed characters in localStorage
        addFailedId(currentCharacter.id);

        // Show the correct answer and mark the input as incorrect
        feedbackMessage.innerText = `Incorrecto. El romaji correcto era: "${correctAnswer}"`;
        feedbackMessage.className = "text-sm font-semibold p-3 rounded-xl bg-rose-50 text-rose-700 block";

        // Wait a bit longer before moving to the next question to give the user time to read the feedback
        setTimeout(() => {
            userInput.disabled = false;
            submitBtn.disabled = false;
            nextQuestion();
        }, 3000);
    }
});

// Initial load of characters when the page is ready
loadCharacters();