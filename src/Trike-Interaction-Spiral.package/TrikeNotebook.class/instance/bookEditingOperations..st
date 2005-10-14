operations
bookEditingOperations: aPage 
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
				arguments: #()).
	aPage class = self defaultPageClass
		ifTrue: [result
				add: (SpiralAction
						label: 'close threat model'
						buttonLabel: nil
						receiver: self
						selector: #removeSpecificPage:
						arguments: {aPage})].
	^ result