operations
interestingOperationCategories: arguments 
	"Answer a SpiralActions containing all operation categories  
	that are interesting for me."
	| result |
	result := SpiralActions new.
	result
		add: (SpiralAction
				label: 'book editing'
				receiver: self
				selector: #bookEditingOperations:
				arguments: arguments).
	^ result