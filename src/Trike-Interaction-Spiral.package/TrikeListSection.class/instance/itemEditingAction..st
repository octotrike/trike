event handling
itemEditingAction: aComponent 
	^ GenericActions
		label: 'edit item'
		receiver: self
		selector: #itemEditingActions:
		arguments: {aComponent}