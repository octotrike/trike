accessing
allButtonCategories
	"Answer a SpiralActions representing message categories that 
	could potentially interest me, i.e. invoking the actions in my 
	answer will yield SpiralActions which contain the actions that 
	interest me."
	| result |
	result := super allButtonCategories.
	notebook
		ifNotNil: [result
				add: (SpiralAction
						label: 'opening assessments'
						receiver: notebook
						selector: #bookEditingOperations
						arguments: #())
				beforeIndex: 1].
	^ result