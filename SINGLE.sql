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
PRIMARY KEY(ClientID)
);

Create table Event(
TourName NVARCHAR(100),
EventMonth NVARCHAR(3),
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
EventYear INT,
Payment DECIMAL,
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

