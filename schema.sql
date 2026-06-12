-- Drop tables if they exist to allow clean resets
DROP TABLE IF EXISTS characters;

-- Main table for study characters
CREATE TABLE characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kana TEXT NOT NULL UNIQUE,          -- The Japanese symbol (e.g., 'あ')
    romaji TEXT NOT NULL,              -- The romaji pronunciation (e.g., 'a')
    group_name TEXT NOT NULL,          -- To filter by lesson (e.g., 'vowels', 'ka', 'sa')
    kana_type TEXT DEFAULT 'hiragana'  -- 'hiragana' or 'katakana'
);

-- Insert initial seed data (The 5 vowels to start testing)
INSERT INTO characters (kana, romaji, group_name) VALUES 
('あ', 'a', 'vowels'),
('い', 'i', 'vowels'),
('う', 'u', 'vowels'),
('え', 'e', 'vowels'),
('お', 'o', 'vowels');