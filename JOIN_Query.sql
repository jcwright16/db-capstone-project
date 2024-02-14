SELECT
	Customer.CustomerID,
    Customer.CustomerName,
    Orders.OrderID,
    Orders.Cost,
    MenuSection.SectionName,
    Menu.CourseName
FROM Customer
LEFT JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
LEFT JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID
LEFT JOIN Menu
ON OrderItems.MenuID = Menu.MenuID
LEFT JOIN MenuSection
ON Menu.SectionID = MenuSection.SectionID
WHERE Orders.Cost > 150
ORDER BY Orders.Cost;