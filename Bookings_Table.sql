CREATE TABLE Bookings (
BookingID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
BookingDate DATE,
TableNumber INT,
CustomerID VARCHAR(50),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

SELECT * FROM Bookings;

INSERT INTO Bookings (BookingDate, TableNumber, CustomerID) VALUES
(DATE('2022-10-10'), 5, '00-988-1489'),
(DATE('2022-11-12'), 3, '03-575-7094'),
(DATE('2022-10-11'), 2, '03-133-1843'),
(DATE('2022-10-13'), 2, '00-988-1489');

# CustomerID Values: 00-988-1489, 03-133-1843, 03-575-7094