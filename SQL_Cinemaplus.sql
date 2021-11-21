CREATE DATABASE Cinemaplus
USE Cinemaplus

CREATE TABLE Branches
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

INSERT INTO Branches
VALUES
('28 Mall'),
('Deniz Mall'),
('Azerbaijan Cinema'),
('Amburan Mall'),
('Ganjlik Mall'),
('Ganja Mall')

SELECT * FROM Branches

CREATE TABLE Halls
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(30),
	BranchID INT FOREIGN KEY REFERENCES Branches(ID)
)

INSERT INTO Halls
VALUES 
('Hall 1',3),
('VIP 9',2),
('Platinum',4),
('Hall 8',2),
('Tam Kart',1),
('PASA Bank',5)

SELECT * FROM Halls

CREATE TABLE Movies
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

INSERT INTO Movies
VALUES
('King Richard'),
('Ghostbusters: Afterlife'),
('The Addams Family 2'),
('The French Dispatch'),
('Venom: Let There Be Carnage'),
('Eternals'),
('Dune')

SELECT * FROM Movies

CREATE TABLE Languages
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

INSERT INTO Languages
VALUES
('Azərbaycanca'),
('In English'),
('Türkçə'),
('Rusca')

SELECT * FROM Languages

CREATE TABLE MovieLanguages
(
	ID INT IDENTITY PRIMARY KEY,
	MovieID INT FOREIGN KEY REFERENCES Movies(ID),
	LanguageID INT FOREIGN KEY REFERENCES Languages(ID)
)

INSERT INTO MovieLanguages
VALUES
(1,2),
(2,3),
(3,2),
(5,4),
(4,2),
(6,2),
(7,1)

SELECT * FROM MovieLanguages


CREATE TABLE Seanses
(
	ID INT IDENTITY PRIMARY KEY,
	MovieLanguagesID INT FOREIGN KEY REFERENCES MovieLanguages(ID),
	HallID INT FOREIGN KEY REFERENCES Halls(ID),
	Time DATETIME,
	SubtitleLanguageID INT FOREIGN KEY REFERENCES Languages(ID),
	Price DECIMAL(30,2)
)

INSERT INTO Seanses
VALUES
(7,2,'2021-12-01 20:30',1,20.00),
(6,1,'2021-11-13 19:30',1,25.00),
(4,3,'2021-12-02 20:00',1,8.00),
(5,4,'2021-11-25 21:15',1,6.00),
(3,6,'2021-10-05 18:15',1,20.00),
(1,5,'2021-12-10 20:30',1,15.00),
(2,2,'2021-11-20 21:00',1,5.00)

SELECT * FROM Seanses

