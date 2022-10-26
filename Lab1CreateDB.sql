create database ArtGalleryMS;
use ArtGalleryMS
drop database ArtGalleryMS
use Company
--> Teil 1
-->a. Das Erstellen zweier Tabellen, von denen eine der Tabellenein zusammengesetztes Primärschlüsselhat. Erstelle gleichzeitig auch die Fremdschlüssel.

create table Galleries
(
	galleryID int not null Primary key IDENTITY(1,1),
	galleryName varchar(70),
	openingYear int
	);

create table Guests (
	guestID int not null Primary key IDENTITY(1,1),
	name varchar(80),
	birthDate date,
	gender varchar(70)
	);

	
create table Visited(
	galleryID int not null,
	guestID int not null,
	PRIMARY KEY(galleryID, guestID),

	CONSTRAINT FK_Visited_Galleries_By_Guests Foreign key(galleryID) references Galleries(galleryID),
	Foreign key(guestID) references Guests(guestID),
	);


create table Painters(
	painterID int not null Primary Key IDENTITY(1,1),
	name varchar(50),
	birthDate date,
	origin varchar(50)
	);

create table Paintings(
	paintingID int not null Primary Key IDENTITY(1,1),
	name varchar(100),
	creationYear int,
	painterID int,
	galleryID int,
	Foreign Key (painterID) references Painters(painterID),
	Foreign Key (galleryID) REFERENCES Galleries(galleryID)
);



CREATE TABLE Addresses(
	addressID int primary key IDENTITY(1,1),
	street varchar(70),
	number int not null,
	city varchar(70),
	land varchar(70)
	);

CREATE TABLE Employees(
	employeeID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	addressID int,
	name varchar(100),
	overtime int,
	galleryID int,
	gender varchar(50),
	funktion varchar(50),
	FOREIGN KEY (addressID) references Addresses(addressID),
	FOREIGN KEY (galleryID) references Galleries(galleryID),
	FOREIGN KEY (funktion) references Functions(name)

	);

CREATE TABLE Favourites (
	paintingID int not null,
	guestID int not null,
	PRIMARY KEY(paintingID, guestID),
	CONSTRAINT FK_Favourite_Paintings Foreign key(paintingID) references Paintings(paintingID),
	Foreign key(guestID) references Guests(guestID),
	);


CREATE TABLE Gallerists
(
	galleristID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR(50),
	addressID INT NOT NULL,
	bithDate date
	FOREIGN KEY(addressID) REFERENCES Addresses(addressID)
);

--> gallery sells painting to gallerist(gallery is deduced from painting)

create table Receipts (
	receiptID int not null primary key IDENTITY(1,1),
	date date,
	galleristID int,
	FOREIGN KEY (galleristID) references gallerists(galleristID)
	);

create table Sold (
	soldID int not null primary key IDENTITY(1,1),
	receiptID int,
	paintingID int,
	price int,
	FOREIGN KEY (receiptID) references Receipts(receiptID),
	FOREIGN KEY(paintingID) references Paintings(paintingID)
	);

create table Functions (
	name varchar(50) NOT NULL PRIMARY KEY,
	pay int,
	);
	
