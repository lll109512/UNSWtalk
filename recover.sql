PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
CREATE TABLE pass_info(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
ZID TEXT NOT NULL UNIQUE,
PASS TEXT NOT NULL
);
CREATE TABLE user_info(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
ZID TEXT NOT NULL UNIQUE,
FULL_NAME TEXT,
HOME_LATITUDE NUMERIC,
HOME_LONGITUDE NUMERIC,
HOME_SUBURB TEXT,
PROGRAM TEXT,
FRIENDS TEXT,
EMAIL TEXT,
COURSES TEXT,
BIRTHDAY TEXT,
IMG TEXT);
CREATE TABLE posts(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
MESSAGE TEXT,
'FROM' TEXT NOT NULL,
'TIME' TEXT NOT NULL,
LATITUDE NUMERIC,
LONGITUDE NUMERIC
);
CREATE TABLE comments(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
MESSAGE TEXT,
'FROM' TEXT NOT NULL,
'TIME' TEXT NOT NULL,
POSTID INTEGER NOT NULL,
FOREIGN KEY(POSTID) REFERENCES posts(ID)
on delete cascade
);
CREATE TABLE reply(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
MESSAGE TEXT,
'FROM' TEXT NOT NULL,
'TIME' TEXT NOT NULL,
COMMENTID INTEGER NOT NULL,
FOREIGN KEY(COMMENTID) REFERENCES comments(ID)
on delete cascade
);
CREATE TABLE profile(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
ZID TEXT NOT NULL UNIQUE,
PROFILE TEXT
);
CREATE TABLE account_setting(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
ZID TEXT NOT NULL UNIQUE,
SUSPEND TEXT,
PRIVACY_LEVEL TEXT
);

CREATE TABLE ready_table(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
TOKEN TEXT NOT NULL UNIQUE,
TYPE TEXT NOT NULL,
JSON TEXT NOT NULL
);
DELETE FROM sqlite_sequence;
COMMIT;
