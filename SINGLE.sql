--Task 2
/*
Tour(TourName, Descripion)
Primary Key(TourName)

Client(ClientID,Surname,GivenName,Gender)
Primary Key(ClientID)

Event(TourName,EventYear,EventMonth,EventDay,EventFee)
Primary Key(TourName, EventYear,EventMonth,EventDay)
Foreign Key(TourName)

Booking(ClientID,TourName,EventYear,EventMonth,EventDay,Payment,DateBooked)
Primary Key(ClientID, TourName,EventYear,EventMonth,EventDay)
Foreign Key(ClientID) References Client
Foreign Key(TourName,EventYear,EventMonth,EventDay) References Event
*/

--Task 2
Drop table IF EXISTS dbo.Booking;
Drop table IF EXISTS dbo.Event;
Drop table IF EXISTS dbo.Client;
Drop table IF EXISTS dbo.Tour;

Create table Tour(
TourName NVARCHAR(100), 
Description NVARCHAR(500),
PRIMARY KEY(TourName)
);

Create table Client(
ClientID INT,
Surname NVARCHAR(100) NOT NULL,
GivenName NVARCHAR(100) NOT NULL,
Gender  NVARCHAR(1),
CHECK (Gender IN ('M','F','I')),
PRIMARY KEY(ClientID)
);

Create table Event(
TourName NVARCHAR(100),
EventMonth NVARCHAR(3),
EventMonth VARCHAR(3),
CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr','May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
EventDay INT,
EventYear INT,
EventFee DECIMAL NOT NULL,
PRIMARY KEY(TourName,EventMonth,EventDay,EventYear),
Foreign KEY(TourName) References Tour
);

Create table Booking(
ClientID INT,
TourName NVARCHAR(100),
EventMonth  NVARCHAR(3),
EventDay INT,
CHECK(EventDay between 1 and 31),
EventYear INT,
CHECK (DATALENGTH(EventYear)=4),
Payment DECIMAL,
CHECK (Payment>0),
DateBooked DATE NOT NULL,
PRIMARY KEY(ClientID, TourName, EventMonth, EventDay, EventYear),
FOREIGN KEY(ClientID) REFERENCES Client,
FOREIGN KEY(TourName, EventMonth,EventDay,EventYear) REFERENCES Event
);

--Task 2

INSERT INTO Tour(TourName, Description) VALUES ('North','Tour of wineries and outlets of the Bedigo and Castlemaine region');
INSERT INTO Tour(TourName, Description) VALUES ('South','Tour of wineries and outlets of Mornington Penisula');
INSERT INTO Tour(TourName, Description) VALUES ('West','Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Client(ClientID,Surname,GivenName,Gender) VALUES (1,'Price','Taylor','M');
INSERT INTO Client(ClientID,Surname,GivenName,Gender) VALUES (2,'Gamble','Ellyse','F');
INSERT INTO Client(ClientID,Surname,GivenName,Gender) VALUES (3,'Tan','Tilly','F');

INSERT INTO Event(TourName,EventMonth,EventDay,EventYear,EventFee) VALUES ('North','Jan',9,2016,200);
INSERT INTO Event(TourName,EventMonth,EventDay,EventYear,EventFee) VALUES ('North','Feb',13,2016,225);
INSERT INTO Event(TourName,EventMonth,EventDay,EventYear,EventFee) VALUES ('South','Jan',9,2016,200);
INSERT INTO Event(TourName,EventMonth,EventDay,EventYear,EventFee) VALUES ('South','Jan',16,2016,200);
INSERT INTO Event(TourName,EventMonth,EventDay,EventYear,EventFee) VALUES ('West','Jan',29,2016,225);

INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (1,'North','Jan',9,2016,200,'12/10/2015');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (2,'North','Jan',9,2016,200,'12/16/2015');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (1,'North','Feb',13,2016,225,'1/8/2016');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (2,'North','Feb',13,2016,125,'1/14/2016');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (3,'North','Feb',13,2016,225,'2/3/2016');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (1,'South','Jan',9,2016,200,'12/10/2015');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (2,'South','Jan',16,2016,200,'12/18/2015');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (3,'South','Jan',16,2016,200,'1/9/2016');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (2,'West','Jan',29,2016,225,'12/17/2015');
INSERT INTO Booking(ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES (3,'West','Jan',29,2016,200,'12/18/2015');

--Task 3
Select * from Tour; 
Select * from Client; 
Select * from Event; 
Select * from Booking;

--taks 4 
--Query 1 (Join)
SELECT C.GivenName, C.Surname, T.TourName, T.Description, E.EventYear, E.EventMonth, E.EventDay, E.EventFee, B.DateBooked, B.Payment
From Booking B
INNER JOIN Client C ON B.ClientID=C.ClientID
LEFT OUTER JOIN Event E ON E.TourName=B.TourName
RIGHT OUTER JOIN Tour T ON T.TourName=B.TourName;

--Query 2 (A Query)
SELECT EventMonth, TourName, COUNT(ClientID) as 'Num Bookings'
FROM Booking
GROUP BY EventMonth, TourName;

--Query 3 (Subquery)
SELECT * 
FROM Booking 
WHERE Payment>(SELECT AVG(Payment) From Booking);

--Task 5(Create a View)
drop view NewBooking;

CREATE VIEW NewBooking AS
SELECT C.GivenName, C.Surname, T.TourName, T.Description, E.EventYear, E.EventMonth, E.EventDay, E.EventFee, B.DateBooked, B.Payment
From Booking B
INNER JOIN Client C ON B.ClientID=C.ClientID
INNER JOIN Event E ON E.TourName=B.TourName
INNER JOIN Tour T ON T.TourName=B.TourName


SELECT * FROM NewBooking

--Task 6(Test queries)
Gender IN ('M','F','I')
EventDay between 1 and 31
EventYear, DATALENGTH(EventYear)=4)
EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr','May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
Payment>0

Based on the dictionary