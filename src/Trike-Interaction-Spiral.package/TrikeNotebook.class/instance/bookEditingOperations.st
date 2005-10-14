operations
bookEditingOperations
	"Answer a SpiralActions containing all book editing operations 
	my instances support."
	| result |
	result := SpiralActions new.
	result
		add: (SpiralAction
				label: 'new threat model'
				buttonLabel: 'new'
				receiver: self
				selector: #addPage
				arguments: #());
		
		add: (SpiralAction
				label: 'close current threat model'
				buttonLabel: nil
				receiver: self
				selector: #removePage
				arguments: #()).
	^ result