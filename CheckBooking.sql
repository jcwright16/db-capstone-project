DELIMITER //
CREATE PROCEDURE CheckBooking(IN TableNo INT, IN DateCheck DATE)
BEGIN
SELECT
	IF(TableNo IN (SELECT DISTINCT TableNumber FROM Bookings), CONCAT("Table ",TableNo," is booked on ",DateCheck), CONCAT("Table ",TableNo," is available on ",DateCheck)) AS Booking_Check
FROM Bookings
WHERE BookingDate = DateCheck;
END//

CALL CheckBooking(1, '2022-10-13');