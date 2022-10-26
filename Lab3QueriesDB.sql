	

-->b.Das Einfügen von Daten (wenigstens in zwei Tabellen)
INSERT INTO Galleries VALUES('Louvre', 1793); --> has id 1
INSERT INTO Galleries VALUES('Byzanthia', 1995);--> has id 2
INSERT INTO Galleries VALUES('Museum of Modern Art', 1929) --> has id 5
select * from Galleries

INSERT INTO Guests VALUES('Ion Pop', '1966-12-23', 'male'); --> has id 1
INSERT INTO Guests VALUES('Ioana Moldovan', '1989-01-25', 'female');

-->c.Zeige auch ein Beispiel von Datenbei dem Einfügen, welche die Fremdschlüsselintegritätsregel nicht erfüllen und darum nicht eingefügt werden können.
--> es gibt keinen Gast mit ID 3(es gibt nur 2 Gaste)
INSERT INTO Visited VALUES(1, 1000);

INSERT INTO Visited VALUES(1, 2)
INSERT INTO Visited VALUES(2, 3)
INSERT INTO Visited VALUES(1, 4)

SELECT * FROM Guests
insert into Functions Values('cashier', 2300);
insert into Functions Values('floor manager', 3000);
insert into Functions Values('artist', 8000);

INSERT INTO Addresses VALUES('Crinului', '22', 'Cluj-Napoca', 'Romania');
INSERT INTO Addresses VALUES('Nicolae Cristea', '28', 'Cluj-Napoca', 'Romania');
INSERT INTO Addresses VALUES('Stefan Cel Mare', '109', 'Brasov', 'Romania');
INSERT INTO Addresses VALUES('Rue de Rivoli', '9', 'Paris', 'France');
INSERT INTO Addresses VALUES('Rue Saint-Dominique', '10', 'Paris', 'France');
INSERT INTO Addresses VALUES('Baurat-Marx Allee', '78', 'Dortmund', 'Germany');
INSERT INTO Addresses VALUES('Am Gardenkamp', '44', 'Dortmund', 'Germany');
-->galeriile
--> Louvre
INSERT INTO Addresses(street, city, land) VALUES('Rue de Rivoli', 'Paris', 'France')
--> Byzanthia
INSERT INTO Addresses VALUES('D.D. Rosca', 14,'Cluj-Napoca', 'Romania')
-->Museum of Modern Art
INSERT INTO Addresses VALUES('W 53rd St', 11,'New York', 'United States of America')

INSERT INTO Employees VALUES(1, 'Andrei Popescu', 2, 1, 'male', 'cashier');
INSERT INTO Employees VALUES(2, 'Ana Raicu', 19, 2, 'female', 'cashier');
INSERT INTO Employees VALUES(3, 'Anne-Marie Menard', 10, 2, 'female', 'artist');
INSERT INTO Employees VALUES(4, 'Marie Chapeau', 10, 2, 'female', 'artist');
INSERT INTO Employees VALUES(5, 'Jeanne Rigaudeau', 3, 2, 'female', 'floor manager');
INSERT INTO Employees(addressID, name, galleryID, gender, funktion) VALUES(5, 'Diana Bondor', 2, 'female', 'cashier');
INSERT INTO Employees VALUES(3, 'Dan Boland ', 1, 2, 'male', 'floor manager');
INSERT INTO Employees VALUES(3, 'Dana Budeanu', 1, 2, 'female', 'cashier');
INSERT INTO Employees VALUES(6,'Hanna Schmidt', 12, 1, 'female', 'artist');
INSERT INTO Employees VALUES(1006,'Anitta Wolff', 30, 5, 'female', 'artist');


INSERT INTO Gallerists VALUES('Miguel', 1, '1999-03-19')
INSERT INTO Gallerists VALUES('Marian', 5, '1978-08-13')
INSERT INTO Gallerists VALUES('Heinz', 6, '1990-01-21')
select * from Gallerists
INSERT INTO Receipts VALUES('2022-09-22', 2);
INSERT INTO Receipts VALUES('2022-10-03', 3);
INSERT INTO Receipts VALUES('2022-10-07', 3);
INSERT INTO Receipts VALUES('2022-09-22', 3);

INSERT INTO Painters VALUES('Vincent Van Gogh','1853-03-30', 'Netherlands');
INSERT INTO Painters VALUES('Claude Monet','1840-11-14', 'France');
select * from Galleries

INSERT INTO Paintings VALUES('Sunflowers', 1889, 1, 2)

INSERT INTO Paintings VALUES('A Starry Night', 1889, 1, 1);
INSERT INTO Paintings VALUES('Autoportret', 1889, 1, 2)
INSERT INTO Paintings VALUES('Two rats', 1884, 1, 2)
INSERT INTO Paintings VALUES('The Pair of Shoes', 1886, 1, 2);
INSERT INTO Paintings VALUES('Sorrow', 1882, 1, 1);
INSERT INTO Paintings VALUES('La Promenade', 1875, 4, 5);


INSERT INTO Sold VALUES(1, 4, 4900);
INSERT INTO Sold VALUES(2, 5, 7000);
INSERT INTO Sold VALUES(2, 7, 10000);
INSERT INTO Sold VALUES(3, 6, 4000);
INSERT INTO Sold VALUES(2, 8, 20700);

INSERT INTO Sold VALUES(3, 9, 100);
INSERT INTO Sold VALUES(1002, 1008, 500);

INSERT INTO Favourites VALUES(4, 3);

SELECT * FROM Receipts
SELECT * FROM Sold
SELECT * FROM Paintings
select * from Functions

--> d.
select * from Employees

UPDATE Employees  SET Employees.overtime = Employees.overtime + 3 
WHERE Employees.name LIKE 'A%-%' AND Employees.overtime BETWEEN 10 AND 20  


DELETE FROM Employees WHERE Employees.funktion IN ('cashier') AND
			Employees.overtime IS NULL; 



--> Teil 2

--> returneaza media preturilor cu care au fost vandute picturi de la galeriile Byzanthia/Louvre
--> inainte de data de 5 octombrie 2022
	SELECT AVG(S.price) FROM Sold S 
		JOIN Paintings P ON S.paintingID = P.paintingID 
		JOIN Receipts R ON S.receiptID = R.receiptID 
		JOIN Galleries G ON P.galleryID = G.galleryID
		WHERE ((G.galleryName = 'Louvre' OR G.galleryName = 'Byzanthia' ) AND R.date < '2022-10-05')
	 
		select * from Paintings

--> totalul pt fiecare factura a lui Heinz pentru picturi cumparate  de la Galeria "Byzanthia"
-->GROUP BY +  MULTIPLE JOINS
SELECT  G.galleristID, SUM(S.price) FROM Sold S 

	JOIN Receipts R ON S.receiptID = R.receiptID 
	JOIN Gallerists G ON R.galleristID = G.galleristID
	JOIN Paintings P ON S.paintingID = P.paintingID 
	JOIN Galleries GA ON P.galleryID = GA.galleryID 

	WHERE GA.galleryName='Byzanthia' AND G.Name = 'Heinz'
	GROUP BY R.receiptID, G.galleristID
	 

	

-->DISTINCT, UNION, NOT IN

--> numele galeriilor de arta care au angajate femei/barbati cu functii mai inalte care sa aiba overtime mai mult de 10 ore
SELECT 
	DISTINCT G.galleryName FROM Galleries G 
		JOIN Employees E ON G.galleryID = E.galleryID 
		WHERE E.gender ='female' 
		AND E.funktion NOT IN ( SELECT F.name FROM Functions F 
										WHERE F.pay < 4000)
		AND E.overtime > 10	

	UNION

SELECT 
	DISTINCT G.galleryName FROM Galleries G 
		JOIN  Employees E ON G.galleryID = E.galleryID 
		WHERE E.gender ='male' AND E.funktion NOT IN ( SELECT F.name FROM Functions F WHERE F.pay < 4000)
		AND E.overtime > 10


-->SELECTEAZA PICTURILE VANDUTE DE LA LOUVRE CU MAI MULT DE 4000
--> EXCEPT , JOINS
SELECT S.price, P.name FROM Sold S
	JOIN Paintings P ON S.paintingID = P.paintingID 
	JOIN Galleries G ON P.galleryID = G.galleryID 
	WHERE G.galleryName = 'Louvre'
	
EXCEPT
		SELECT S.price, P.name FROM Sold S 
		JOIN Paintings P ON S.paintingID = P.paintingID
		WHERE S.price < 4000
		

--> totalul unei facturi care contine o anumita pictura pt un gallerist anume
-->poate pictura e facuta in mai multe exemplare
--> INTERSECT, JOINS
SELECT SUM(S1.price) FROM Sold S1 
	JOIN Receipts R ON S1.receiptID = R.receiptID

	WHERE S1.receiptID = 
		(	SELECT R.receiptID FROM Sold S 
			JOIN Receipts R on S.receiptID = R.receiptID 
			JOIN Gallerists G ON R.galleristID = G.galleristID
			WHERE G.Name = 'Heinz' 
	
		INTERSECT 

		SELECT R.receiptID FROM Sold S 
			JOIN Paintings P ON S.paintingID =  P.paintingID 
			JOIN Receipts R on S.receiptID = R.receiptID 
			WHERE P.name = 'Two rats'
		)

--> selecteaza cea/cele mai vechi picturi din galeria deschisa cel mai recent
-->ORDER BY, TOP, ALL, JOINS
SELECT TOP 1 WITH TIES P.creationYear, P.name FROM Paintings P 
	JOIN Galleries G ON P.galleryID = G.galleryID
	JOIN Painters PA ON P.painterID = PA.painterID
	WHERE G.openingYear >= ALL(
			SELECT Galleries.openingYear FROM Galleries)
	AND PA.origin = 'Netherlands'
	ORDER BY P.creationYear 
						
								
	select * from Paintings where galleryID = 2
	SELECT * FROM Galleries
	select * from Painters

-->DA GALERIILE PE CARE LE-A VIZITAT DE 2 ORI SAU MAI MULT UN GUEST ANUME + NUME GUEST + DE CATE ORI A VIZITAT
-->JOINS, GROUP BY, HAVING
SELECT G.galleryName, GU.name, count(*) FROM Galleries G
	JOIN Visited V ON G.galleryID = V.galleryID
	JOIN Guests GU ON V.guestID = GU.guestID
	GROUP BY G.galleryName, GU.name
	HAVING COUNT(*) >= 2  
	
	select * from Guests
	SELECT * FROM Visited


-->DA-MI GALERIILE SI MEDIA DE VARSTA A VIZITATORILOR EI ( CELE CARE SUNT VIZITATE DE CATRE MAI MULTI TINERI)
SELECT G.galleryName ,AVG(YEAR(CURRENT_TIMESTAMP) - YEAR(GU.birthDate)) FROM Galleries G 
	JOIN Visited V ON G.galleryID = V.galleryID
	JOIN Guests GU ON V.guestID = GU.guestID
	GROUP BY G.galleryName
	HAVING AVG(YEAR(CURRENT_TIMESTAMP) - YEAR(GU.birthDate)) < 55 
	

-->reda toti angajatii care au mai mult de 15 ore de overtime si stau la adrese din afara tarii unde se afla galeria 
SELECT * FROM Employees E	
	JOIN Galleries G ON E.galleryID = G.galleryID
	JOIN Addresses A ON E.addressID = A.addressID
	WHERE  A.city != any(SELECT Addresses.city FROM Addresses WHERE Addresses.addressID = G.addressID)  


-->AFISEAZA IN ORDINE DESCRESCATOARE A NUMARULUI DE VIZITATORI GALERIILE VIZITATE SI NUMARUL LOR DE VIZITATORI
SELECT G.galleryName, COUNT(*) FROM Galleries G
	JOIN Visited V ON G.galleryID = V.galleryID 
	GROUP BY G.galleryName
	ORDER BY COUNT(*) DESC


--> OUTER JOIN
-->picturile din galeria Byzanthia care sa nu apara in lista de favorite a niciunui vizitator
SELECT * FROM Paintings P
	LEFT OUTER JOIN Favourites F ON P.paintingID = F.paintingID
	LEFT OUTER JOIN Galleries G ON P.galleryID = G.galleryID
	WHERE G.galleryName = 'Byzanthia' AND F.paintingID IS NULL AND F.guestID IS NULL


