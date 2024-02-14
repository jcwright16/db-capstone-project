DELIMITER //
CREATE PROCEDURE AddValidBooking(IN TableNo INT, IN DateToBook DATE)
BEGIN
	START TRANSACTION;
	INSERT INTO Bookings (TableNumber, BookingDate) VALUES (TableNo, DateToBook);
    
    IF(TableNo IN (SELECT DISTINCT TableNumber FROM Bookings WHERE BookingDate = DateToBook))
    THEN 
    SELECT DISTINCT CONCAT("Table ",TableNo," is already booked on ",DateToBook,". Booking cancelled.") AS `Booking Status` FROM Bookings;
    ROLLBACK;
    ELSE
    SELECT DISTINCT CONCAT("Table ",TableNo," has been booked for ",DateToBook) AS `Booking Status` FROM Bookings;
    COMMIT;
    END IF;
END//

CALL AddValidBooking(6, "2022-12-17")//