event handling
addListMenuItems: aMenu for: aComponent 
	aComponent
		ifNotNil: [(self itemEditingOperations: aComponent) addItemsToMenu: aMenu].
	^ aMenu