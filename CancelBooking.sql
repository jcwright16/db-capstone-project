DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
START TRANSACTION;
	DELETE FROM Bookings WHERE BookingID = booking_id;
    IF booking_id NOT IN (SELECT DISTINCT BookingID FROM Bookings)
    THEN SELECT DISTINCT CONCAT("Booking ",booking_id," not found") AS `Booking Status` FROM Bookings;
    ROLLBACK;
    ELSE SELECT DISTINCT CONCAT("Booking ",booking_id," cancelled") AS `Booking Status` FROM Bookings;
    END IF;
END//

CALL CancelBooking(9)//