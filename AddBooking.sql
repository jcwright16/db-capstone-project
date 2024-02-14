DELIMITER //
CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id VARCHAR(50), IN booking_date DATE, IN table_number INT)
BEGIN
START TRANSACTION;
	INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES
	(booking_id, customer_id, booking_date, table_number);
    IF table_number IN (SELECT DISTINCT TableNumber FROM Bookings WHERE BookingDate = booking_date)
    THEN SELECT DISTINCT CONCAT("Table ",table_number," is already booked on ",booking_date) AS `Booking Status` FROM Bookings;
    ROLLBACK;
    ELSE SELECT DISTINCT CONCAT("Booking table ",table_number," for ",booking_date) AS `Booking Status` FROM Bookings;
    COMMIT;
    END IF;
END//

CALL AddBooking(9, '03-575-7094', '2022-12-30', 4)//