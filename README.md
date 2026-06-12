# Nihongo - Hiragana & Katakana Master

**Nihongo** is a web-based flashcard game designed to help users learn and master the Japanese Hiragana and Katakana alphabets. The application presents Kana characters and prompts the user to enter the corresponding Romaji pronunciation. It features multiple game modes for both Hiragana and Katakana, along with a smart repetition system to reinforce learning on difficult characters.

This project is built with a Python Flask backend, a SQLite database for character storage, and a clean, responsive frontend using Tailwind CSS and vanilla JavaScript.

## Features

- **Dual Alphabet Practice**: Study both Hiragana (平仮名) and Katakana (片仮名).
- **Multiple Practice Modes**: Choose how you want to study each alphabet.
  - **Basic Sounds**: The 46 fundamental syllables (e.g., あ, カ).
  - **Modified Sounds (Nigori)**: Characters with *dakuten* (゛) and *handakuten* (゜) marks (e.g., が, パ).
  - **Diphthongs (Yōon)**: Combined sounds (e.g., きゃ, シュ).
  - **Marathon**: A challenging mode that shuffles all 100+ characters of the selected alphabet.
- **Smart Repetition System**: The app uses browser `localStorage` to remember characters you answer incorrectly. It then intelligently re-introduces them more frequently in future sessions to help you conquer tricky characters.
- **Instant Feedback**: Receive immediate confirmation of whether your answer is correct or incorrect to accelerate learning.
- **Score Tracking**: Keep track of your correct answers in each session.
- **Clean and Focused UI**: A minimalist interface ensures a distraction-free learning experience.

## Tech Stack

- **Backend**: Python, Flask
- **Database**: SQLite
- **Frontend**: HTML, Tailwind CSS, Vanilla JavaScript

## Local Setup and Installation

Follow these steps to run the application on your local machine.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/nachobecerra38/nihongo.git
    cd nihongo
    ```

2.  **Install the required Python packages:**
    (It is recommended to use a virtual environment)
    ```bash
    pip install -r requirements.txt
    ```

3.  **Initialize the database:**
    This command creates an `instance/game.db` file and populates it with all the Hiragana and Katakana characters from `schema.sql`.
    ```bash
    python database.py
    ```

4.  **Run the Flask application:**
    ```bash
    python app.py
    ```

5.  **Open the application:**
    Navigate to `http://127.0.0.1:5000` in your web browser.

## How to Play

1.  On the home screen, first select the alphabet you wish to practice: "Hiragana (平仮名)" or "Katakana (片仮名)".
2.  Choose a practice mode from the list: "Sonidos Básicos," "Sonidos Modificados," "Diptongos," or the "Maratón."
3.  On the game screen, a Kana character will be displayed.
4.  Type the corresponding Romaji pronunciation into the input field. The input is not case-sensitive.
5.  Press the "Comprobar" button or hit `Enter`.
6.  If your answer is correct, your score increases, and a new character appears after a short delay.
7.  If your answer is incorrect, the correct Romaji is displayed. The app will log this error, increasing the chances you will see this character again soon. After a few seconds, a new character is shown.

## API Endpoint

The application uses an API to fetch the characters for each game mode.

### Get Characters

- **Endpoint**: `GET /api/characters`
- **Description**: Retrieves a JSON list of Kana characters based on the specified group and type.

#### Query Parameters:

| Parameter | Value      | Description                                                                           |
| :-------- | :--------- | :------------------------------------------------------------------------------------ |
| `type`    | `hiragana` | **(Default)** Returns Hiragana characters.                                            |
| `type`    | `katakana` | Returns Katakana characters.                                                          |
| `group`   | `basics`   | Returns the 46 core characters.                                                       |
| `group`   | `modified` | Returns Dakuten and Handakuten characters (Nigori).                                   |
| `group`   | `yoon`     | Returns diphthong characters.                                                         |
| `group`   | `all`      | **(Default)** Returns the entire set of characters for the specified `type`.          |

**Example Request (Katakana Basic Sounds):**
```
GET /api/characters?type=katakana&group=basics