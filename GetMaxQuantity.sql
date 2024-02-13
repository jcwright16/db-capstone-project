DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) FROM OrderItems;
END //

CALL GetMaxQuantity();