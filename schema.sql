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

-- Insert full basic Hiragana alphabet (46 core characters)
INSERT INTO characters (kana, romaji, group_name) VALUES 
-- Vowels
('あ', 'a', 'vowels'), ('い', 'i', 'vowels'), ('う', 'u', 'vowels'), ('え', 'e', 'vowels'), ('お', 'o', 'vowels'),
-- K-Group
('か', 'ka', 'ka'), ('き', 'ki', 'ka'), ('く', 'ku', 'ka'), ('け', 'ke', 'ka'), ('こ', 'ko', 'ka'),
-- S-Group
('さ', 'sa', 'sa'), ('し', 'shi', 'sa'), ('す', 'su', 'sa'), ('せ', 'se', 'sa'), ('そ', 'so', 'sa'),
-- T-Group
('た', 'ta', 'ta'), ('ち', 'chi', 'ta'), ('つ', 'tsu', 'ta'), ('て', 'te', 'ta'), ('と', 'to', 'ta'),
-- N-Group
('な', 'na', 'na'), ('に', 'ni', 'na'), ('ぬ', 'nu', 'na'), ('ね', 'ne', 'na'), ('の', 'no', 'na'),
-- H-Group
('は', 'ha', 'ha'), ('ひ', 'hi', 'ha'), ('ふ', 'fu', 'ha'), ('へ', 'he', 'ha'), ('ほ', 'ho', 'ha'),
-- M-Group
('ま', 'ma', 'ma'), ('み', 'mi', 'ma'), ('む', 'mu', 'ma'), ('め', 'me', 'ma'), ('も', 'mo', 'ma'),
-- Y-Group (Only 3 characters)
('や', 'ya', 'ya'), ('ゆ', 'yu', 'ya'), ('よ', 'yo', 'ya'),
-- R-Group
('ら', 'ra', 'ra'), ('り', 'ri', 'ra'), ('る', 'ru', 'ra'), ('れ', 're', 'ra'), ('ろ', 'ro', 'ra'),
-- W-Group & Singular N (3 characters)
('わ', 'wa', 'wa'), ('を', 'wo', 'wa'), ('ん', 'n', 'n');