DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
START TRANSACTION;
	UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
    IF booking_id NOT IN (SELECT DISTINCT BookingID FROM Bookings)
    THEN SELECT DISTINCT CONCAT("BookingID ",booking_id," not found") AS `Booking Status` FROM Bookings;
    ROLLBACK;
    ELSE SELECT DISTINCT CONCAT("Booking ",booking_id," updated") AS `Booking Status` FROM Bookings;
    END IF;
END//

CALL UpdateBooking(9, '2022-12-17')//