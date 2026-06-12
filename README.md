# Nihongo - Hiragana Master

**Nihongo** is a web-based flashcard game designed to help users learn and master the Japanese Hiragana alphabet. The application presents Hiragana characters and prompts the user to enter the corresponding Romaji pronunciation. It features multiple game modes and a smart repetition system to reinforce learning.

This project is built with a Python Flask backend, a SQLite database, and a clean, responsive frontend using Tailwind CSS.

## Features

- **Multiple Practice Modes**: Choose how you want to study.
  - **Basic Sounds**: The 46 fundamental Hiragana syllables (e.g., あ, か, さ).
  - **Modified Sounds (Nigori)**: Practice characters with *dakuten* (゛) and *handakuten* (゜) marks (e.g., が, ぱ).
  - **Diphthongs (Yōon)**: Test your knowledge of combined sounds (e.g., きゃ, しゅ).
  - **Marathon**: A challenging mode that shuffles all 100+ characters together.
- **Smart Repetition System**: The app uses browser `localStorage` to remember characters you get wrong. It then intelligently re-introduces them more frequently in future sessions to help you conquer difficult characters.
- **Instant Feedback**: Receive immediate confirmation of whether your answer is correct or incorrect to learn quickly.
- **Score Tracking**: Keep track of your correct answers in each session.
- **Clean and Focused UI**: A minimalist interface built with Tailwind CSS ensures a distraction-free learning experience.

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
    This command will create an `instance/game.db` file and populate it with the Hiragana characters from `schema.sql`.
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

1.  On the home screen, choose a practice mode: "Sonidos Básicos," "Sonidos Modificados," "Diptongos," or "Maratón."
2.  On the play screen, a Hiragana character will be displayed.
3.  Type the corresponding Romaji pronunciation into the input field. The input is not case-sensitive.
4.  Press the "Comprobar" button or hit `Enter`.
5.  If your answer is correct, your score will increase, and a new character will appear after a short delay.
6.  If your answer is incorrect, the correct Romaji will be displayed. The app will note this error, and you will see this character again sooner. After a few seconds, a new character will be shown.

## API Endpoint

The application uses a simple API to fetch the characters for the game.

### Get Characters

- **Endpoint**: `GET /api/characters`
- **Description**: Retrieves a JSON list of Hiragana characters based on the specified group.

#### Query Parameters:

| Parameter | Value      | Description                                                      |
| :-------- | :--------- | :--------------------------------------------------------------- |
| `group`   | `basics`   | Returns the 46 core Hiragana characters.                         |
| `group`   | `modified` | Returns Dakuten and Handakuten characters (Nigori).              |
| `group`   | `yoon`     | Returns diphthong characters.                                    |
| `group`   | `all`      | Returns the entire set of Hiragana characters from the database. |

**Example Request:**
```
GET /api/characters?group=basics