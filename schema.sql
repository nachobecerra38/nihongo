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

-- Insert full Hiragana alphabet with groupings for lessons
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


-- --- BASIC KATAKANA (46 characters, kana_type = 'katakana') ---
-- Vowels
INSERT INTO characters (kana, romaji, group_name, kana_type) VALUES 
('ア', 'a', 'vowels', 'katakana'), ('イ', 'i', 'vowels', 'katakana'), ('ウ', 'u', 'vowels', 'katakana'), ('エ', 'e', 'vowels', 'katakana'), ('オ', 'o', 'vowels', 'katakana'),
-- K-Group
('カ', 'ka', 'ka', 'katakana'), ('キ', 'ki', 'ka', 'katakana'), ('ク', 'ku', 'ka', 'katakana'), ('ケ', 'ke', 'ka', 'katakana'), ('コ', 'ko', 'ka', 'katakana'),
-- S-Group
('サ', 'sa', 'sa', 'katakana'), ('シ', 'shi', 'sa', 'katakana'), ('ス', 'su', 'sa', 'katakana'), ('セ', 'se', 'sa', 'katakana'), ('ソ', 'so', 'sa', 'katakana'),
-- T-Group
('タ', 'ta', 'ta', 'katakana'), ('チ', 'chi', 'ta', 'katakana'), ('ツ', 'tsu', 'ta', 'katakana'), ('テ', 'te', 'ta', 'katakana'), ('ト', 'to', 'ta', 'katakana'),
-- N-Group
('ナ', 'na', 'na', 'katakana'), ('ニ', 'ni', 'na', 'katakana'), ('ヌ', 'nu', 'na', 'katakana'), ('ネ', 'ne', 'na', 'katakana'), ('ノ', 'no', 'na', 'katakana'),
-- H-Group
('ハ', 'ha', 'ha', 'katakana'), ('ヒ', 'hi', 'ha', 'katakana'), ('フ', 'fu', 'ha', 'katakana'), ('ヘ', 'he', 'ha', 'katakana'), ('ホ', 'ho', 'ha', 'katakana'),
-- M-Group
('マ', 'ma', 'ma', 'katakana'), ('ミ', 'mi', 'ma', 'katakana'), ('ム', 'mu', 'ma', 'katakana'), ('メ', 'me', 'ma', 'katakana'), ('モ', 'mo', 'ma', 'katakana'),
-- Y-Group
('ヤ', 'ya', 'ya', 'katakana'), ('ユ', 'yu', 'ya', 'katakana'), ('ヨ', 'yo', 'ya', 'katakana'),
-- R-Group
('ラ', 'ra', 'ra', 'katakana'), ('リ', 'ri', 'ra', 'katakana'), ('ル', 'ru', 'ra', 'katakana'), ('レ', 're', 'ra', 'katakana'), ('ロ', 'ro', 'ra', 'katakana'),
-- W-Group & N
('ワ', 'wa', 'wa', 'katakana'), ('ヲ', 'wo', 'wa', 'katakana'), ('ン', 'n', 'n', 'katakana');

-- --- KATAKANA MODIFICADOS (Nigori, kana_type = 'katakana') ---
-- G-Group
INSERT INTO characters (kana, romaji, group_name, kana_type) VALUES 
('ガ', 'ga', 'ga', 'katakana'), ('ギ', 'gi', 'ga', 'katakana'), ('グ', 'gu', 'ga', 'katakana'), ('ゲ', 'ge', 'ga', 'katakana'), ('ゴ', 'go', 'ga', 'katakana'),
-- Z-Group
('ザ', 'za', 'za', 'katakana'), ('ジ', 'ji', 'za', 'katakana'), ('ズ', 'zu', 'za', 'katakana'), ('ゼ', 'ze', 'za', 'katakana'), ('ゾ', 'zo', 'za', 'katakana'),
-- D-Group
('ダ', 'da', 'da', 'katakana'), ('ヂ', 'ji', 'da', 'katakana'), ('ヅ', 'zu', 'da', 'katakana'), ('デ', 'de', 'da', 'katakana'), ('ド', 'do', 'da', 'katakana'),
-- B-Group
('バ', 'ba', 'ba', 'katakana'), ('ビ', 'bi', 'ba', 'katakana'), ('ブ', 'bu', 'ba', 'katakana'), ('ベ', 'be', 'ba', 'katakana'), ('ボ', 'bo', 'ba', 'katakana'),
-- P-Group
('パ', 'pa', 'pa', 'katakana'), ('ピ', 'pi', 'pa', 'katakana'), ('プ', 'pu', 'pa', 'katakana'), ('ペ', 'pe', 'pa', 'katakana'), ('ポ', 'po', 'pa', 'katakana');

-- --- KATAKANA DIPTONGOS (Yōon, kana_type = 'katakana') ---
-- K & G
INSERT INTO characters (kana, romaji, group_name, kana_type) VALUES 
('キャ', 'kya', 'yoon', 'katakana'), ('キュ', 'kyu', 'yoon', 'katakana'), ('キョ', 'kyo', 'yoon', 'katakana'),
('ギャ', 'gya', 'yoon', 'katakana'), ('ギュ', 'gyu', 'yoon', 'katakana'), ('ギョ', 'gyo', 'yoon', 'katakana'),
-- S & Z
('シャ', 'sha', 'yoon', 'katakana'), ('シュ', 'shu', 'yoon', 'katakana'), ('ショ', 'sho', 'yoon', 'katakana'),
('ジャ', 'ja', 'yoon', 'katakana'), ('ジュ', 'ju', 'yoon', 'katakana'), ('ジョ', 'jo', 'yoon', 'katakana'),
-- T
('チャ', 'cha', 'yoon', 'katakana'), ('チュ', 'chu', 'yoon', 'katakana'), ('チョ', 'cho', 'yoon', 'katakana'),
-- N, M, R
('ニャ', 'nya', 'yoon', 'katakana'), ('ニュ', 'nyu', 'yoon', 'katakana'), ('ニョ', 'nyo', 'yoon', 'katakana'),
('ミャ', 'mya', 'yoon', 'katakana'), ('ミュ', 'myu', 'yoon', 'katakana'), ('ミョ', 'myo', 'yoon', 'katakana'),
('リャ', 'rya', 'yoon', 'katakana'), ('リュ', 'ryu', 'yoon', 'katakana'), ('リョ', 'ryo', 'yoon', 'katakana'),
-- B & P
('ビャ', 'bya', 'yoon', 'katakana'), ('ビュ', 'byu', 'yoon', 'katakana'), ('ビョ', 'byo', 'yoon', 'katakana'),
('ピャ', 'pya', 'yoon', 'katakana'), ('ピュ', 'pyu', 'yoon', 'katakana'), ('ピョ', 'pyo', 'yoon', 'katakana');