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
-- Y-Group
('や', 'ya', 'ya'), ('ゆ', 'yu', 'ya'), ('よ', 'yo', 'ya'),
-- R-Group
('ら', 'ra', 'ra'), ('り', 'ri', 'ra'), ('る', 'ru', 'ra'), ('れ', 're', 'ra'), ('ろ', 'ro', 'ra'),
-- W-Group & Singular N
('わ', 'wa', 'wa'), ('を', 'wo', 'wa'), ('ん', 'n', 'n'),

-- --- DAKUTEN & HANDAKUTEN (Nigori) ---
-- G-Group (From K)
('が', 'ga', 'ga'), ('ぎ', 'gi', 'ga'), ('ぐ', 'gu', 'ga'), ('げ', 'ge', 'ga'), ('ご', 'go', 'ga'),
-- Z-Group (From S)
('ざ', 'za', 'za'), ('じ', 'ji', 'za'), ('ず', 'zu', 'za'), ('ぜ', 'ze', 'za'), ('ぞ', 'zo', 'za'),
-- D-Group (From T)
('だ', 'da', 'da'), ('ぢ', 'ji', 'da'), ('づ', 'zu', 'da'), ('で', 'de', 'da'), ('ど', 'do', 'da'),
-- B-Group (From H)
('ば', 'ba', 'ba'), ('び', 'bi', 'ba'), ('ぶ', 'bu', 'ba'), ('べ', 'be', 'ba'), ('ぼ', 'bo', 'ba'),
-- P-Group (Handakuten - From H)
('ぱ', 'pa', 'pa'), ('ぴ', 'pi', 'pa'), ('ぷ', 'pu', 'pa'), ('ぺ', 'pe', 'pa'), ('ぽ', 'po', 'pa'),

-- --- YOON (Diphthongs) ---
-- K & G
('きゃ', 'kya', 'yoon'), ('きゅ', 'kyu', 'yoon'), ('きょ', 'kyo', 'yoon'),
('ぎゃ', 'gya', 'yoon'), ('ぎゅ', 'gyu', 'yoon'), ('ぎょ', 'gyo', 'yoon'),
-- S & Z
('しゃ', 'sha', 'yoon'), ('しゅ', 'shu', 'yoon'), ('しょ', 'sho', 'yoon'),
('じゃ', 'ja', 'yoon'), ('じゅ', 'ju', 'yoon'), ('じょ', 'jo', 'yoon'),
-- T
('ちゃ', 'cha', 'yoon'), ('ちゅ', 'chu', 'yoon'), ('ちょ', 'cho', 'yoon'),
-- N, M, R
('にゃ', 'nya', 'yoon'), ('にゅ', 'nyu', 'yoon'), ('にょ', 'nyo', 'yoon'),
('みゃ', 'mya', 'yoon'), ('みゅ', 'myu', 'yoon'), ('みょ', 'myo', 'yoon'),
('りゃ', 'rya', 'yoon'), ('りゅ', 'ryu', 'yoon'), ('りょ', 'ryo', 'yoon'),
-- B & P
('びゃ', 'bya', 'yoon'), ('びゅ', 'byu', 'yoon'), ('びょ', 'byo', 'yoon'),
('ぴゃ', 'pya', 'yoon'), ('ぴゅ', 'pyu', 'yoon'), ('ぴょ', 'pyo', 'yoon');