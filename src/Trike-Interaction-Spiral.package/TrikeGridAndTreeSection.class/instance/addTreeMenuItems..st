event handling
addTreeMenuItems: aMenu 
	^currentTreeItem
		ifNil: [aMenu]
		ifNotNil: [(MorphicMenuAction wrap: self itemEditingAction) actionsMenu]