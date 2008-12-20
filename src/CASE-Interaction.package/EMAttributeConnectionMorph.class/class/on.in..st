instance creation
on: graphModel in: aDiagrammer 
	"Answer a new instance of me with the given graphModel as part of a display controlled by diagrammer.  Assumes all objects I connect have already been created by aDiagrammer."
	
	| newInstance |
	newInstance := super on: graphModel in: aDiagrammer.
	newInstance
		fromMorph: (aDiagrammer morphFor: graphModel anchor)
		toMorph: (aDiagrammer morphFor: graphModel).
	^newInstance