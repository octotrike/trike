event handling
addTreeMenuItems: aMenu 
	currentTreeItem
		ifNotNil: [self itemEditingOperations addItemsToMenu: aMenu].
	^ aMenu