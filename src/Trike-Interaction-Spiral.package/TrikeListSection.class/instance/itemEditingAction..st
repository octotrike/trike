event handling
itemEditingAction: aComponent 
	^ GenericActions
		label: 'Edit Item'
		receiver: self
		selector: #itemEditingActions:
		arguments: {aComponent}