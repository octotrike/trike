event handling
addListMenuItems: aMenu for: aComponent 
	^aComponent
		ifNil: [aMenu]
		ifNotNil: [(MorphicMenuAction wrap: (self itemEditingAction: aComponent)) actionsMenu]