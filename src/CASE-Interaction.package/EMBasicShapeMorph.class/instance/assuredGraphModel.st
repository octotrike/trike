accessing
assuredGraphModel
	"Ensure I have a graph model, and answer it."
	
	^graphModel
		ifNil: [self initializeGraphModel]
		ifNotNil: [graphModel]
	