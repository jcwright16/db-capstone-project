SELECT DISTINCT
	SectionName
FROM (
	SELECT
		MenuSection.SectionName,
		OrderItems.Quantity
	FROM MenuSection
	LEFT JOIN Menu
	ON MenuSection.SectionID = Menu.SectionID
	LEFT JOIN OrderItems
	ON Menu.MenuID = OrderItems.MenuID
	WHERE Quantity > ANY(
		SELECT
			Quantity
		FROM OrderItems
	)
) Section_Quantity;