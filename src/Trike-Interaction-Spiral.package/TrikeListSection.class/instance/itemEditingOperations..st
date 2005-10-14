event handling
itemEditingOperations: aComponent 
	"Answer a SpiralActions containing all item editing operations  
	my instances support."
	| result |
	result := SpiralActions new.
	result
		add: (SpiralAction
				label: 'remove ' , self componentName
				buttonLabel: nil
				receiver: aComponent
				selector: #remove
				arguments: #()).
	^ result