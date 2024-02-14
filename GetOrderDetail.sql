PREPARE GetOrderDetail FROM '
SELECT DISTINCT
	Orders.OrderID, 
	OrderItems.Quantity, 
    Orders.Cost 
FROM Orders 
LEFT JOIN OrderItems 
ON Orders.OrderID = OrderItems.OrderID 
WHERE Orders.CustomerID = ?';

SET @id = '84-300-6499';
EXECUTE GetOrderDetail USING @id;

